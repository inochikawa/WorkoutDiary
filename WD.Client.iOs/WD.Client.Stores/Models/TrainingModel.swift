//
//  TrainingDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;

struct TrainingModel : Identifiable {
    var id: String?;
    var createdDate:Date?;
    var exercises: [ExerciseModel] = [ExerciseModel]();
    
    init() {
        self.id = "\(UUID())";
        self.createdDate = Date();
    }
    
    init(id: String, createdDate: Date, exercises: [ExerciseModel]) {
        self.id = id;
        self.createdDate = createdDate;
        self.exercises = exercises;
    }
}
