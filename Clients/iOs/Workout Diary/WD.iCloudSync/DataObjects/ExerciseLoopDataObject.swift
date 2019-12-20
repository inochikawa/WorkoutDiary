//
//  ExerciseLoopDataObject.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 19.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class ExerciseLoopDataObject: Codable {
    var id: String = "";
    var repeats: Int = 0;
    var weight: Double = 0;
    var exerciseId: String = "";
    
    init(from model: ExerciseLoopModel) {
        self.id = model.id;
        self.repeats = model.repeats;
        self.weight = model.weight;
        self.exerciseId = model.exerciseId;
    }
}
