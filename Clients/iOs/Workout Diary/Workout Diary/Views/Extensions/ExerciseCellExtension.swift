//
//  ExerciseCellExtension.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 07.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit

extension ExerciseCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let exerciseLoop = self.exerciseViewModel!.loops[indexPath.row];

        let config = newActionItemContextMenuConfiguration(onEditTap: {
            if let safeDelegate = self.delegate {
                safeDelegate.onEditExerciseLoop(exerciseId: exerciseLoop.exerciseId, exerciseLoopId: exerciseLoop.id);
            }
        }, onDeleteTap: {
            if let safeDelegate = self.delegate {
                safeDelegate.onRemoveExerciseLoop(exerciseId: exerciseLoop.exerciseId, exerciseLoopId: exerciseLoop.id);
            }
        });

        return config;
    }
}

extension ExerciseCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let safeViewModel = self.exerciseViewModel {
            return safeViewModel.loopsCount;
        } else {
            return 0;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantData.Cell.ExerciseLoopCellId, for: indexPath) as! ExerciseLoopCell;
        
        let viewModel = self.exerciseViewModel!.loops[indexPath.row];
        
        cell.prepareCell(viewModel);
        
        return cell;
    }
    
    
}
