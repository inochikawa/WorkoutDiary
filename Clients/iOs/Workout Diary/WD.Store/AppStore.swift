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
    
    public func appendCreatedItem(trainingViewModel: TrainingDetailsViewModel) {
        let training = TrainingModel(viewModel: trainingViewModel);
        self.dataSource.data.append(training);
        
        self.refreshTrainingsList();
    }
    
    public func updateTraining(from viewModel: TrainingDetailsViewModel) {
        self.dataSource.data = self.dataSource.data.filter { i in i.id! != viewModel.id };
        self.dataSource.data.append(TrainingModel(viewModel: viewModel));

        self.refreshTrainingsList();
    }
    
    public func resortTrainings() {
        self.trainings = self.trainings.sorted(by: {
            (a, b) in
            return b.date < a.date;
        });
    }
}
