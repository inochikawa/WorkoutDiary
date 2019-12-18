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
    
    var store: AppStore = Resolver.resolve();
    var selectedTrainingId: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listTableView.dataSource = self;
        self.listTableView.delegate = self;
        self.listTableView.register(UINib(nibName: ConstantData.Nib.TrainingListCellNibName, bundle: nil), forCellReuseIdentifier: ConstantData.Cell.TrainingListCellId);
        self.listTableView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 100, right: 0);
        
        self.navigationController?.navigationBar.prefersLargeTitles = true;
        
        self.setUpRefreshControl();
        self.reloadListViewDataAsync(forceRefreshControl: true);
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
            
            let alert = UIAlertController(title: "Training is still in progress", message: "You need to stop selected training before you can edit it.", preferredStyle: .alert);
            
            alert.addAction(UIAlertAction(title: "Stop Training and Edit", style: .default, handler: { (alertAction) -> Void in
                selectedTraining.isInProgress = false;
                selectedTraining.finishedDate = Date();
                self.store.updateTraining(from: selectedTraining);
                
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
    }
    
    public func navigateToDetails(selectedIndexPath: IndexPath) {
        let trainingListViewModel = self.sections[selectedIndexPath.section].trainings[selectedIndexPath.row];
        self.selectedTrainingId = trainingListViewModel.id;
        
        self.performSegue(withIdentifier: ConstantData.Segue.ToTrainingDetailsSequeId, sender: self)
    }
    
    @objc private func reloadListViewDataAsync(forceRefreshControl: Bool = false) {
        if forceRefreshControl {
            self.startRefreshControl();
        }
        
        self.refreshSections();
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + .milliseconds(200)) {
            self.finishUpdatingUI();
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
        self.listTableView.refreshControl?.addTarget(self, action: #selector(self.reloadListViewDataAsync), for: .valueChanged)
    }

    private func startRefreshControl() {
        self.listTableView.setContentOffset(CGPoint(x: 0, y: -(listTableView.refreshControl?.frame.size.height ?? 0)), animated: true);
        self.listTableView.refreshControl?.beginRefreshing();
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
            res.append(TrainingListSection(name: "On This Week", trainings: onThisWeekTrainings));
        }
        
        if olderTrainings.count > 0 {
            res.append(TrainingListSection(name: "Older", trainings: olderTrainings));
        }
        
        self.sections = res;
    }
}
