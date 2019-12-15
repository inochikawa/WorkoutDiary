//
//  AppStore.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 05.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation


class AppStore {
    private var dataSource: DataSource;
    
    var trainings: [TrainingListViewModel] = [];
    var isEditMode: Bool = true;
    
    init(with dataSource: DataSource ) {
        self.dataSource = dataSource;
    }
    
    public func getTrainingViewModelBy(id: String) -> TrainingDetailsViewModel {
        let training = self.dataSource.getTrainingBy(id: id)!;
        return TrainingDetailsViewModel(model: training);
    }
    
    public func reloalTrainingsList(forceReload: Bool = false, didLoadCallback: @escaping () -> Void = {}) {
        self.dataSource.reloadData(forceReload: forceReload) { data in
            self.trainings = data.map { TrainingListViewModel(model: $0) };
            self.resortTrainings();
            didLoadCallback();
        };
    }
    
    public func refreshTrainingsList() {
        self.trainings = self.dataSource.data.map { TrainingListViewModel(model: $0) };
        self.resortTrainings();
    }
    
    public func createNewTraining() {
        let training = TrainingModel();

        self.dataSource.data.append(training)
        self.refreshTrainingsList();
    }
    
    public func getExerciseLoopViewModel(_ trainingId: String, _ exerciseId: String, _ exerciseLoopId: String?) -> ExerciseLoopViewModel {
        
        let training: TrainingModel = dataSource.data.filter {i in i.id == trainingId}.first!;
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
    
        let training: TrainingModel = dataSource.data.filter {i in i.id == trainingId}.first!;
        
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
        self.dataSource.data = self.dataSource.data.filter { i in i.id! != viewModel.id };
        self.dataSource.data.append(TrainingModel(viewModel: viewModel));

        self.refreshTrainingsList();
    }
    
    public func removeTraining(by id:String) {
        self.trainings = self.trainings.filter{i in i.id != id};
        self.dataSource.data = self.dataSource.data.filter{i in i.id != id};
    }
    
    public func resortTrainings() {
        self.trainings = self.trainings.sorted(by: {
            (a, b) in
            return b.date < a.date;
        });
    }
}
