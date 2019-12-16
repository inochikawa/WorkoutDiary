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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ConstantData.Segue.FromTrainingDetail_ToEditExerciseLoop {
            if let viewController = segue.destination as? EditExerciseLoopModalViewController {
                viewController.delegate = self;
                viewController.prepareExerciseLoopViewModel(trainingId: self.trainingDetailsViewModel!.id, exerciseId: self.selectedExerciseId, exerciseLoopId: self.selectedExerciseLoopId);
            }
        }
        
        if segue.identifier == ConstantData.Segue.FromTrainingDetail_ToEditExercise {
            if let viewController = segue.destination as? EditExerciseViewController {
                viewController.delegate = self;
                viewController.prepareViewController(trainingId: self.trainingDetailsViewModel!.id, exerciseId: self.selectedExerciseId);
            }
        }
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = newActionItemContextMenuConfiguration(onEditTap: {
            self.selectedExerciseId = self.trainingDetailsViewModel!.exercises[indexPath.row].id;
            self.selectedExerciseLoopId = nil;
            self.navigateToEditExerciseModal();
        }, onDeleteTap: {
            let exerciseId = self.trainingDetailsViewModel!.exercises[indexPath.row].id;
            self.trainingDetailsViewModel!.exercises = self.trainingDetailsViewModel!.exercises.filter {i in i.id != exerciseId};

            self.store.updateTraining(from: self.trainingDetailsViewModel!);
            self.exerciseListView.reloadData();
            self.refreshCompletedExercisesCountLabel();
            self.setupNoExercisesLabel();
        });
        return config;
    }
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
        cell.delegate = self;
        cell.exerciseLoopCollectionView.reloadData();
        
        return cell;
    }

}

extension TrainingDetailsViewController : ExerciseCellDelegate {

    func onAddExerciseLoop(exerciseId: String) {
        self.selectedExerciseId = exerciseId;
        self.selectedExerciseLoopId = nil;
        self.navigateToEditExerciseLoopModal();
    }
    
    func onEditExerciseLoop(exerciseId: String, exerciseLoopId: String) {
        self.selectedExerciseId = exerciseId;
        self.selectedExerciseLoopId = exerciseLoopId;
        self.navigateToEditExerciseLoopModal();
    }
    
    func onRemoveExerciseLoop(exerciseId: String, exerciseLoopId: String) {
        let exercise = self.trainingDetailsViewModel!.exercises.filter {i in i.id == exerciseId}.first!;
        exercise.loops = exercise.loops.filter{i in i.id != exerciseLoopId};
        
        self.store.updateTraining(from: self.trainingDetailsViewModel!);
        self.exerciseListView.reloadData();
    }

}

extension TrainingDetailsViewController : EditExerciseLoopModalDelegate {

    func onOkModalTap(exerciseLoopViewModel: ExerciseLoopViewModel) {
        
        let exercise = self.trainingDetailsViewModel!.exercises.filter{i in i.id == self.selectedExerciseId}.first;
        
        if self.selectedExerciseLoopId == nil {
            exercise!.loops.append(exerciseLoopViewModel);
        } else {
            let loop = exercise!.loops.filter {i in i.id == self.selectedExerciseLoopId}.first!;
            loop.weight = exerciseLoopViewModel.weight;
            loop.repeats = exerciseLoopViewModel.repeats;
        }
        
        self.store.updateTraining(from: self.trainingDetailsViewModel!);
        self.exerciseListView.reloadData();
    }

}

extension TrainingDetailsViewController : EditExerciseModalViewDelegate {
    func onOkClick(exerciseViewModel: ExerciseViewModel) {
        
        if self.selectedExerciseId == nil {
            self.trainingDetailsViewModel!.exercises.append(exerciseViewModel)
        } else {
            let exercise = self.trainingDetailsViewModel!.exercises.filter {i in i.id == self.selectedExerciseId!}.first!;
            exercise.name = exerciseViewModel.name;
        }
        
        self.store.updateTraining(from: self.trainingDetailsViewModel!);
        self.exerciseListView.reloadData();
        self.refreshCompletedExercisesCountLabel();
        self.setupNoExercisesLabel();
    }
}
