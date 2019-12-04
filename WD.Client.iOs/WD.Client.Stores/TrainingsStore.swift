//
//  TrainingsStore.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class TrainingsStore: ObservableObject {
    private var appStore: DataSource;
    
    @Published var trainings: [TrainingListViewModel] = [];
    @Published var isEditMode: Bool = true;
    
    init(with appStore: DataSource ) {
        self.appStore = appStore;
    }
    
    public func getTrainingViewModelBy(id: String) -> TrainingDetailsViewModel {
        let training = self.appStore.getTrainingBy(id: id)!;
        return TrainingDetailsViewModel(model: training);
    }
    
    public func reloalTrainingsList(forceReload: Bool = false) {
        self.appStore.reloadData(forceReload: forceReload) { data in
            self.trainings = data.map { TrainingListViewModel(model: $0) };
            self.resortTrainings();
        };
    }
    
    public func refreshTrainingsList() {
        self.trainings = self.appStore.data.map { TrainingListViewModel(model: $0) };
        self.resortTrainings();
    }
    
    public func createNewTraining() {
        let training = TrainingModel();

        self.appStore.data.append(training)
        self.refreshTrainingsList();
    }
    
    public func updateTraining(from viewModel: TrainingDetailsViewModel) {
        self.appStore.data = self.appStore.data.filter { i in i.id! != viewModel.id };
        self.appStore.data.append(TrainingModel(viewModel: viewModel));

        self.refreshTrainingsList();
    }
    
    public func resortTrainings() {
        self.trainings = self.trainings.sorted(by: {
            (a, b) in
            return b.date < a.date;
        });
    }
}
