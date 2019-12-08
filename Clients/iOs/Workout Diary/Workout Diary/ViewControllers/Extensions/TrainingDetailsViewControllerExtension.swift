//
//  TrainingDetailsViewControllerExtension.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 07.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit


extension TrainingDetailsViewController : UITableViewDelegate  {
    
}

extension TrainingDetailsViewController : UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let safeViewModel = self.trainingDetailsViewModel {
            return safeViewModel.exercisesCount;
        } else {
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exerciseViewModel = self.trainingDetailsViewModel!.exercises[indexPath.row];
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantData.Cell.ExerciseCellId, for: indexPath) as! ExerciseCell;
        cell.setViewModel(exerciseViewModel);
        
        cell.exerciseLoopCollectionView.reloadData();
        
        return cell;
    }
    
    
}
