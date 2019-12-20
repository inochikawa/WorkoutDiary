//
//  TrainingViewModel.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class TrainingListSection {
    var name: String = "";
    var trainings: [TrainingListViewModel] = [];
    
    init(name: String, trainings: [TrainingListViewModel]) {
        self.name = name;
        self.trainings = trainings;
    }
}

class TrainingListViewModel: Identifiable {
    var id: String = "";
    var date: Date = Date();
    var finishedDate: Date = Date();
    var exercisesCount: Int = 0;
    var spentTime: Int = 0;
    var isInProgress: Bool = false;
    var name: String = "";
    
    init() {}
    
    init(model: TrainingModel) {
        self.id = model.id;
        self.date = model.createdDate;
        self.finishedDate = model.finishedDate;
        self.spentTime = model.spentTime;
        self.exercisesCount = model.exercises.count;
        self.isInProgress = model.isInProgress;
        self.name = model.name;
    }
    
    func clone() -> TrainingListViewModel {
        let viewModel = TrainingListViewModel();

        viewModel.id = self.id;
        viewModel.date = self.date;
        viewModel.finishedDate = self.finishedDate;
        viewModel.spentTime = self.spentTime;
        viewModel.exercisesCount = self.exercisesCount;
        viewModel.isInProgress = self.isInProgress;
        viewModel.name = self.name;

        return viewModel;
    }
}
