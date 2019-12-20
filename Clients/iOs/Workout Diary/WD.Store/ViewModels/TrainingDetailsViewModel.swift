//
//  TrainingDetailsViewModel.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class TrainingDetailsViewModel : Identifiable {
    var id: String;
    var name: String;
    var spentTime: Int;
    var isInProgress: Bool;
    var createdDate: Date?;
    var finishedDate: Date?;
    var exercises: [ExerciseViewModel] = [];
    
    init() {
        self.id = "\(UUID())";
        self.createdDate = Date();
        self.name = self.createdDate!.toUserFriendlyString();
        self.isInProgress = true;
        self.spentTime = 0;
    }
    
    init(model: TrainingModel) {
        self.id = model.id;
        self.createdDate = model.createdDate;
        self.finishedDate = model.finishedDate;
        self.isInProgress = model.isInProgress;
        self.spentTime = model.spentTime;
        self.exercises = model.exercises.map { i in return ExerciseViewModel(model: i) };
        self.name = model.name;
    }
    
    init(viewModel: TrainingDetailsViewModel) {
        self.id = viewModel.id;
        self.createdDate = viewModel.createdDate;
        self.finishedDate = viewModel.finishedDate;
        self.isInProgress = viewModel.isInProgress;
        self.spentTime = viewModel.spentTime;
        self.exercises = viewModel.exercises.map { i in return ExerciseViewModel(viewModel: i) };
        self.name = viewModel.name;
    }
}
