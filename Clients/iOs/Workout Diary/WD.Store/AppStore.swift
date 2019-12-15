//
//  AppStore.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 05.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;
import Resolver;

class AppStore {
    var lastWeightIndexSelected: Int = 0;
    var lastRepeatsIndexSelected: Int = 0;
    var lastWeightStepSelected: Int = 0;
    
    init() {
    }
    
    public func getTrainingViewModelBy(id: String) -> TrainingDetailsViewModel {
        let dataSource = DataSource.newInstanse();
        
        let training = dataSource.getTrainingBy(id: id)!;
        return TrainingDetailsViewModel(model: training);
    }
    
    public func createNewTraining() {
        let dataSource = DataSource.newInstanse();
        
        let training = TrainingModel();
        dataSource.addItem(item: training);
    }
    
    func getTrainingListViewModels() -> [TrainingListViewModel] {
        let dataSource = DataSource.newInstanse();
        
        return dataSource.trainings.map{i in TrainingListViewModel(model: i)}.sorted(by: {
            (a, b) in
            return b.date < a.date;
        });
    }
    
    public func getExerciseLoopViewModel(_ trainingId: String, _ exerciseId: String, _ exerciseLoopId: String?) -> ExerciseLoopViewModel {
        let dataSource = DataSource.newInstanse();
        
        let training: TrainingModel = dataSource.trainings.filter {i in i.id == trainingId}.first!;
        let exercise = training.exercises.filter {i in i.id == exerciseId}.first!;
        
        if exerciseLoopId == nil {
            let model = ExerciseLoopViewModel();
            model.exerciseId = exerciseId;
            model.exerciseName = exercise.name;
            return model;
        } else {
            let loop = exercise.loops.filter {i in i.id == exerciseLoopId!}.first!;
            return ExerciseLoopViewModel(model: loop);
        }
    }
    
    public func getExerciseViewModel(_ trainingId: String, _ exerciseId: String?) -> ExerciseViewModel {
        let dataSource = DataSource.newInstanse();
        
        let training: TrainingModel = dataSource.trainings.filter {i in i.id == trainingId}.first!;
        
        if exerciseId == nil {
            let model = ExerciseViewModel();
            model.trainingId = trainingId;
            return model;
        } else {
            let exercise = training.exercises.filter {i in i.id == exerciseId!}.first!;
            return ExerciseViewModel(model: exercise);
        }
    }
    
    public func updateTraining(from viewModel: TrainingDetailsViewModel) {
        let dataSource = DataSource.newInstanse();
        let training = TrainingModel(viewModel: viewModel);
        // if training already exists -> it will be updated
        dataSource.addItem(item: training);
    }
    
    public func removeTraining(by id:String) {
        let dataSource = DataSource.newInstanse();
        
        let training = dataSource.getTrainingBy(id: id)!;
        dataSource.removeItem(item: training);
    }
    
    public func saveChanges() {
        let dataSource = DataSource.newInstanse();
        dataSource.saveChanges();
    }
}
