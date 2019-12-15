//
//  ExerciseViewModel.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 30.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class ExerciseViewModel : Identifiable {
    var id: String;
    var name: String?;
    var loops: [ExerciseLoopViewModel] = [];
    var trainingId: String?;
    
    init() {
        self.id = "\(UUID())";
    }
    
    init(id: String, name: String, loops: [ExerciseLoopViewModel]) {
        self.id = id;
        self.name = name;
        self.loops = loops;
    }
    
    init(model: ExerciseModel) {
        self.id = model.id;
        self.name = model.name;
        self.loops = model.loops.map { i in return ExerciseLoopViewModel(model: i) };
    }
    
    init(viewModel: ExerciseViewModel) {
        self.id = viewModel.id;
        self.name = viewModel.name;
        self.trainingId = viewModel.trainingId;
        self.loops = viewModel.loops.map {i in ExerciseLoopViewModel(viewModel: i)};
    }
}
