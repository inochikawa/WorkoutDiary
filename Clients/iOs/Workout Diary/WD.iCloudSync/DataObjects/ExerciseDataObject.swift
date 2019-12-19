//
//  ExerciseDataObject.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 19.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class ExerciseDataObject: Codable {
    var id: String = "";
    var name: String = "";
    var loops: [ExerciseLoopDataObject] = [];
    var trainingId: String = "";
    
    init(from model: ExerciseModel) {
        self.id = model.id;
        self.name = model.name;
        self.trainingId = model.trainingId ?? "";
        self.loops = model.loops.map({ (loopModel) -> ExerciseLoopDataObject in
            return ExerciseLoopDataObject(from: loopModel);
        })
    }
}
