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
    
    init(with appStore: DataSource ) {
        self.appStore = appStore;
        self.reloalTrainingsList(forceReload: true);
    }
    
    public func getTrainingViewModelBy(id: String) -> TrainingDetailsViewModel {
        return TrainingDetailsViewModel(id: id);
    }
    
    public func reloalTrainingsList(forceReload: Bool = false) {
        self.appStore.reloadData(forceReload: forceReload) { data in
            self.trainings = data.map { TrainingListViewModel(model: $0) };
            self.resortTrainings();
        };
    }
    
    public func createNewTraining() {
//        self.trainings.append(TrainingModel());
//        self.resortTrainings();
    }
    
    public func resortTrainings() {
        self.trainings = self.trainings.sorted(by: {
            (a, b) in
            return b.date < a.date;
        });
    }
}
