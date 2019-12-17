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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.sections.count;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].name;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].trainings.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trainingListViewModel = self.sections[indexPath.section].trainings[indexPath.row];
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantData.Cell.TrainingListCellId, for: indexPath) as! TrainingListCell;
        cell.setViewMode(trainingListViewModel);
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let config = newActionItemContextMenuConfiguration(onEditTap: {
            self.performEditTraining(at: indexPath);
        }, onDeleteTap: {
            self.performRemoveTraining(at: indexPath);
        });
        
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
