//
//  ExerciseLoopViewModel.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 30.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class ExerciseLoopViewModel : Identifiable, ObservableObject {
    var id: String;
    @Published var repeats: Int;
    @Published var weight: Int;
    var exerciseId: String?;
    
    init() {
        self.id = "\(UUID())";
        self.weight = 0;
        self.repeats = 0;
    }
    
    init(id: String, repeats: Int, weight: Int) {
        self.id = id;
        self.repeats = repeats;
        self.weight = weight;
    }
    
    init(model: ExerciseLoopModel) {
        self.id = model.id ?? "";
        self.repeats = model.repeats ?? 0;
        self.weight = model.weight ?? 0;
    }
    
    init(viewModel: ExerciseLoopViewModel) {
        self.id = viewModel.id;
        self.repeats = viewModel.repeats;
        self.weight = viewModel.weight;
        self.exerciseId = viewModel.exerciseId;
    }
    
    public func copyFrom(viewModel: ExerciseLoopViewModel) {
        self.id = viewModel.id;
        self.repeats = viewModel.repeats;
        self.weight = viewModel.weight;
        self.exerciseId = viewModel.exerciseId;
    }
}
