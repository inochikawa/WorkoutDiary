//
//  ExerciseDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;

class ExerciseModel : Identifiable {
    var id: String?;
    var name: String?;
    var loops: [ExerciseLoopModel] = [ExerciseLoopModel]();
    var trainingId: String?;
    
    init() {
        self.id = "\(UUID())";
    }
    
    init(id: String, name: String?, loops: [ExerciseLoopModel], trainingId: String) {
        self.id = id;
        self.loops = loops;
        self.name = name;
        self.trainingId = trainingId;
    }
    
    init(viewModel: ExerciseViewModel) {
        self.id = viewModel.id;
        self.name = viewModel.name;
        self.loops = viewModel.loops.map { i in return ExerciseLoopModel(viewModel: i) };
        self.trainingId = viewModel.trainingId;
    }
}
