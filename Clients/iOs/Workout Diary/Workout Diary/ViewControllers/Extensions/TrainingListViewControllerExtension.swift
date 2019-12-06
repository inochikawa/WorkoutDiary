//
//  TrainingListViewControllerExtension.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 05.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit

extension TrainingListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.store.trainings.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trainingListViewModel = self.store.trainings[indexPath.row];
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantData.TrainingListCellId, for: indexPath) as! TrainingListCell;
        cell.setInfo(trainingListViewModel.date, trainingListViewModel.exercisesCount);
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let config = UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil,
            actionProvider: {_ in
                let editAction = UIAction(title: "Edit", image: UIImage(systemName: "slider.horizontal.3")) {(uiAction) in
                    self.performEditTraining(at: indexPath);
                }
                
                let removeAction = UIAction(title: "Remove", image: UIImage(systemName: "trash"), attributes: [
                    UIMenuElement.Attributes.destructive
                ]) {(uiAction) in
                    self.performRemoveTraining(at: indexPath);
                }
                
                let menu = UIMenu(title: "Training's actions", identifier: nil, options: [], children: [editAction, removeAction]);
                
                return menu;
            }
        );
        
        return config;
    }
}

extension TrainingListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigateToDetails(selectedIndexPath: indexPath);
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ConstantData.Segue.ToTrainingDetailsSequeId {
            if let detailsViewController = segue.destination as? TrainingDetailsViewController {
                detailsViewController.setTrainingId(self.selectedTrainingId);
            }
        }
    }
    
}
