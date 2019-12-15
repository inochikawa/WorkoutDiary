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
    
    var trainings: [TrainingListViewModel] = [];
    
    var store: AppStore = Resolver.resolve();
    var selectedTrainingId: String?;
    
    var sections: [TrainingListSectionsViewModel] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listTableView.dataSource = self;
        self.listTableView.delegate = self;
        self.listTableView.register(UINib(nibName: ConstantData.Nib.TrainingListCellNibName, bundle: nil), forCellReuseIdentifier: ConstantData.Cell.TrainingListCellId);
        
        self.navigationController?.navigationBar.prefersLargeTitles = true;
        
        self.setUpRefreshControl();
        self.setUpRightButton();
        self.reloadListViewDataAsync(forceRefreshControl: true);
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = self.listTableView.indexPathForSelectedRow {
            self.listTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    public func performEditTraining(at indexPath: IndexPath) {
        // show to user selected row
        self.listTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        
        // navigate to details view after delay. This approach is more user friendly.
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + .milliseconds(500)) {
            self.navigateToDetails(selectedIndexPath: indexPath);
        }
    }
    
    public func performRemoveTraining(at indexPath: IndexPath) {
        let trainingId = self.trainings[indexPath.row].id;
        self.store.removeTraining(by: trainingId);
        self.reloadListViewDataAsync();
    }
    
    public func navigateToDetails(selectedIndexPath: IndexPath) {
        let trainingListViewModel = self.trainings[selectedIndexPath.row];
        self.selectedTrainingId = trainingListViewModel.id;
        
        self.performSegue(withIdentifier: ConstantData.Segue.ToTrainingDetailsSequeId, sender: self)
    }
    
    @objc private func reloadListViewDataAsync(forceRefreshControl: Bool = false) {
        if forceRefreshControl {
            self.startRefreshControl();
        }
        
        self.trainings = self.store.getTrainingListViewModels();
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + .milliseconds(200)) {
            self.finishUpdatingUI();
        }
    }
    
    @objc private func onSyncButtonTouchDown() {
        self.reloadListViewDataAsync(forceRefreshControl: true);
    }
    
    @objc private func onAddTrainingButtonTouchDown() {
        self.store.createNewTraining();
        self.finishUpdatingUI();
        
        // By default all trainings are sorted by Date DESC.
        // So we just navigate to first item in the list after creation
        self.performEditTraining(at: IndexPath(row: 0, section: 0));
    }
    
    private func finishUpdatingUI() {
        self.listTableView.refreshControl?.endRefreshing();
        self.listTableView.reloadData();
        
        let indexRows = self.trainings.indices.map {index in IndexPath(row: index, section: 0)};
        self.listTableView.reloadRows(at: indexRows, with: .right);
    }
    
    private func setUpRefreshControl() {
        self.listTableView.refreshControl = UIRefreshControl();
        
        self.listTableView.refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing data");
        self.listTableView.refreshControl?.tintColor = .red;
        self.listTableView.refreshControl?.addTarget(self, action: #selector(self.reloadListViewDataAsync), for: .valueChanged)
    }
    
    private func setUpRightButton() {
        let button = UIButton(type: .system);
        button.setTitle("Start training", for: .normal);
        button.setImage(UIImage(systemName: "play.fill"), for: .normal);
        
        let spacing: CGFloat = 10.0;
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing);
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0);
        
        button.frame = CGRect(x: 0, y: 0, width: 130, height: 30);
        
        button.addTarget(self, action: #selector(self.onAddTrainingButtonTouchDown), for: .touchDown);
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button);
        self.navigationItem.rightBarButtonItem?.isEnabled = true;
    }

    private func startRefreshControl() {
        self.listTableView.setContentOffset(CGPoint(x: 0, y: -(listTableView.refreshControl?.frame.size.height ?? 0)), animated: true);
        self.listTableView.refreshControl?.beginRefreshing();
    }
}
