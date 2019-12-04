//
//  ExerciseLoopDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;

class ExerciseLoopModel : Identifiable {
    var id: String?;
    var repeats: Int?;
    var weight: Int?;
    var exerciseId: String?;
    
    init() {
        self.id = "\(UUID())";
    }
    
    init(id: String, repeats: Int, weight: Int, exerciseId: String) {
        self.id = id;
        self.repeats = repeats;
        self.weight = weight;
        self.exerciseId = exerciseId;
    }
    
    init(viewModel: ExerciseLoopViewModel) {
        self.id = viewModel.id;
        self.repeats = viewModel.repeats;
        self.weight = viewModel.weight;
        self.exerciseId = viewModel.exerciseId;
    }
}
