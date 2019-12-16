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
    var createdDate: Date?;
    var finishedDate: Date?;
    var exercises: [ExerciseViewModel] = [];
    
    init() {
        self.id = "\(UUID())";
        self.createdDate = Date();
    }
    
    init(model: TrainingModel) {
        self.id = model.id;
        self.createdDate = model.createdDate;
        self.finishedDate = model.finishedDate;
        self.exercises = model.exercises.map { i in return ExerciseViewModel(model: i) };
    }
    
    init(viewModel: TrainingDetailsViewModel) {
        self.id = viewModel.id;
        self.createdDate = viewModel.createdDate;
        self.finishedDate = viewModel.finishedDate;
        self.exercises = viewModel.exercises.map { i in return ExerciseViewModel(viewModel: i) };
    }
}
