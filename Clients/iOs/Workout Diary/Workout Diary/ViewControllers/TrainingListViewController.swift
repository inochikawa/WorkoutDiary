//
//  TrainingListViewController.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 05.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit
import Resolver

class TrainingListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!;
    
    var sections: [TrainingListSection] = [];
    
    let store: AppStore = Resolver.resolve();
    let appSettings: AppSettings = Resolver.resolve();
    let syncService = ICloudSyncService();
    
    var selectedTrainingId: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listTableView.dataSource = self;
        self.listTableView.delegate = self;
        self.listTableView.register(UINib(nibName: ConstantData.Nib.TrainingListCellNibName, bundle: nil), forCellReuseIdentifier: ConstantData.Cell.TrainingListCellId);
        self.listTableView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 100, right: 0);
        
        self.navigationController?.navigationBar.prefersLargeTitles = true;
        
        self.reloadListViewDataAsync();
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.listTableView.refreshControl = nil;
        self.verifyICloudSignIn {
            self.setUpRefreshControl();
        }
        
        if let selectedIndexPath = self.listTableView.indexPathForSelectedRow {
            self.listTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
        self.refreshSections();
        self.listTableView.reloadData();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        for cell in self.listTableView.visibleCells as! [TrainingListCell] {
            cell.stopTrainingProgressTimer();
        }
    }
    
    public func performEditTraining(at indexPath: IndexPath) {
        let selectedTraining = self.sections[indexPath.section].trainings[indexPath.row];
        
        let navigateToDetailsAction: () -> Void = {
            self.selectedTrainingId = selectedTraining.id;
            self.performSegue(withIdentifier: ConstantData.Segue.FromTrainingList_ToEditTrainingModal, sender: self);
        };
        
        if selectedTraining.isInProgress {
            
            let alert = UIAlertController(title: "Training is still in progress", message: "You need to stop selected training before you can edit it.", preferredStyle: .actionSheet);
            
            alert.addAction(UIAlertAction(title: "Stop Training and Edit", style: .default, handler: { (alertAction) -> Void in
                selectedTraining.isInProgress = false;
                selectedTraining.finishedDate = Date();
                self.store.updateTraining(from: selectedTraining);
                
                self.syncService.checkIfICloudContainerAvailable { (isOk) in
                    if isOk {
                        let trainingModel = DataSource.newInstanse().getTrainingBy(id: selectedTraining.id)!;
                        self.syncService.trySaveRecord(TrainingDataObject(from: trainingModel).ckRecord, completionBlock: nil);
                    }
                }
                
                DispatchQueue.main.async {
                    self.refreshSections();
                    self.listTableView.reloadData();
                }
                
                navigateToDetailsAction();
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true);
            
            return;
            
        }
        
        navigateToDetailsAction();
    }
    
    public func performRemoveTraining(at indexPath: IndexPath) {
        let trainingId = self.sections[indexPath.section].trainings[indexPath.row].id;
        self.store.removeTraining(by: trainingId);
        
        self.reloadListViewDataAsync();
        
        self.syncService.checkIfICloudContainerAvailable { (isOk) in
            if isOk {
                self.syncService.tryRemoveRecord(trainingId, successBlock: nil, errorBlock: nil);
            }
        }
    }
    
    public func navigateToDetails(selectedIndexPath: IndexPath) {
        let trainingListViewModel = self.sections[selectedIndexPath.section].trainings[selectedIndexPath.row];
        self.selectedTrainingId = trainingListViewModel.id;
        
        self.performSegue(withIdentifier: ConstantData.Segue.ToTrainingDetailsSequeId, sender: self)
    }
    
    @objc private func reloadListViewDataAsync(forceRefreshControl: Bool = false) {
        let completeAction = {
            self.refreshSections();
            
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + .milliseconds(200)) {
                self.finishUpdatingUI();
            }
        }
        
        if forceRefreshControl {
            self.startRefreshControl();
            
            let allTrainings = DataSource.newInstanse().trainings;
            syncService.trySaveRecords(
                allTrainings.map {TrainingDataObject(from: $0).ckRecord},
                completionBlock: { isSaveSuccess in
                    if isSaveSuccess {
                        self.syncService.fetchAllRecords(successBlock: { (items) in
                            let trainings = items.map { i in TrainingModel(dataObject: i) };
                            self.store.saveTrainings(trainings);
                            
                            completeAction();
                        }) { (error) in
                            completeAction();
                            // TODO: show popup that was error
                        };
                    } else {
                        // TODO: show popup that was error
                        completeAction();
                    }
            });
            
            
        } else {
            completeAction();
        }
        
    }
    
    @objc private func onSyncButtonTouchDown() {
        self.reloadListViewDataAsync(forceRefreshControl: true);
    }
    
    @IBAction func onAddTrainingButtonTouchDown(_ sender: UIButton) {
        self.store.createNewTraining();
        self.refreshSections();
        self.finishUpdatingUI(animateOnlyFirstRow: true, with: .right);
        
        // By default all trainings are sorted by Date DESC.
        // So we just navigate to first item in the list after creation
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + .milliseconds(500)) {
            self.navigateToDetails(selectedIndexPath: IndexPath(row: 0, section: 0));
        }
    }
    
    func refreshSections() {
        let trainings: [TrainingListViewModel] = self.store.getTrainingListViewModels();
        var res = [TrainingListSection]();
        
        let todaysTrainings = trainings.filter {i in i.date.isToday()};
        let yesterdaysTrainings = trainings.filter {i in i.date.isYesterday()};
        let onThisWeekTrainings = trainings.filter {i in !i.date.isToday() && !i.date.isYesterday() && i.date.isOnThisWeek()};
        
        let olderTrainings = trainings.filter {i in !i.date.isToday() && !i.date.isYesterday() && !i.date.isOnThisWeek()};
        
        if todaysTrainings.count > 0 {
            res.append(TrainingListSection(name: "Today", trainings: todaysTrainings));
        }
        
        if yesterdaysTrainings.count > 0 {
            res.append(TrainingListSection(name: "Yesterday", trainings: yesterdaysTrainings));
        }
        
        if onThisWeekTrainings.count > 0 {
            res.append(TrainingListSection(name: "Last 7 days", trainings: onThisWeekTrainings));
        }
        
        if olderTrainings.count > 0 {
            res.append(TrainingListSection(name: "Older", trainings: olderTrainings));
        }
        
        self.sections = res;
    }
    
    private func finishUpdatingUI(animateOnlyFirstRow: Bool = false, with animation: UITableView.RowAnimation = .bottom) {
        self.listTableView.refreshControl?.endRefreshing();
        self.listTableView.reloadData();
        
        var indexRows: [IndexPath] = [];
        
        if animateOnlyFirstRow {
            indexRows.append(IndexPath(row: 0, section: 0));
        } else {
            for i in 0..<self.sections.count {
                for j in 0..<self.sections[i].trainings.count {
                    indexRows.append(IndexPath(row: j, section: i));
                }
            }
        }
        
        self.listTableView.reloadRows(at: indexRows, with: animation);
    }
    
    private func setUpRefreshControl() {
        self.listTableView.refreshControl = UIRefreshControl();
        
        self.listTableView.refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing data");
        self.listTableView.refreshControl?.tintColor = UIColor(named: ConstantData.Color.CancelButton);
        self.listTableView.refreshControl?.addTarget(self, action: #selector(self.onRefreshControlTrigger), for: .valueChanged)
    }
    
    @objc private func onRefreshControlTrigger(sender: Any) {
        self.reloadListViewDataAsync(forceRefreshControl: true);
    }
    
    private func startRefreshControl() {
        self.listTableView.setContentOffset(CGPoint(x: 0, y: -(listTableView.refreshControl?.frame.size.height ?? 0)), animated: true);
        self.listTableView.refreshControl?.beginRefreshing();
    }
    
    private func verifyICloudSignIn(successBlock: @escaping () -> Void) {
        self.syncService.checkIfICloudContainerAvailable { (isOk) in
            if isOk {
                DispatchQueue.main.async {
                    successBlock();
                }
                return;
            }
            
            if !self.syncService.didUserConfirmToEnableICloud && self.appSettings.enableICloudSync {
                DispatchQueue.main.async {
                    presentICloudAlert(from: self);
                }
            }
        }
    }
}
