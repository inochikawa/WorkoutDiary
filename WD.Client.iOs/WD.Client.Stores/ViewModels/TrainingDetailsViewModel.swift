//
//  TrainingDetailsViewModel.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class TrainingDetailsViewModel : Identifiable, ObservableObject {
    var id: String;
    @Published var createdDate: Date?;
    @Published var exercises: [ExerciseViewModel] = [];
    
    init() {
        self.id = "\(UUID())";
        self.createdDate = Date();
    }
    
    init(id: String, createdDate: Date, exercises: [ExerciseViewModel]) {
        self.id = id;
        self.createdDate = createdDate;
        self.exercises = exercises;
    }
    
    init(model: TrainingModel) {
        self.id = model.id ?? "";
        self.createdDate = model.createdDate;
        self.exercises = model.exercises.map { i in return ExerciseViewModel(model: i) };
    }
    
    init(viewModel: TrainingDetailsViewModel) {
        self.id = viewModel.id;
        self.createdDate = viewModel.createdDate;
        self.exercises = viewModel.exercises.map { i in return ExerciseViewModel(viewModel: i) };
    }
    
    public func copyFrom(viewModel: TrainingDetailsViewModel) {
        self.id = viewModel.id;
        self.createdDate = viewModel.createdDate;
        self.exercises = viewModel.exercises.map { i in return ExerciseViewModel(viewModel: i) };
    }
}
