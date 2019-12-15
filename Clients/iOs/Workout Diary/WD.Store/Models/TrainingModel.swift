//
//  TrainingDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;
import RealmSwift;

class TrainingModel : Object, Identifiable {
    @objc dynamic var id: String;
    @objc dynamic var createdDate:Date;
    var exercises: List<ExerciseModel>;
    
    required init() {
        self.id = "\(UUID())";
        self.createdDate = Date();
        self.exercises = List<ExerciseModel>();
    }
    
    
    init(viewModel: TrainingDetailsViewModel) {
        self.id = viewModel.id;
        self.createdDate = viewModel.createdDate ?? Date();
        self.exercises = List<ExerciseModel>();
        
        for exerciseViewModel in viewModel.exercises {
            self.exercises.append(ExerciseModel(viewModel: exerciseViewModel))
        }
    }
    
    override class func primaryKey() -> String? {
        return "id";
    }
}
