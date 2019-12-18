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
    @objc dynamic var isInProgress: Bool;
    @objc dynamic var createdDate: Date;
    @objc dynamic var finishedDate: Date;
    @objc dynamic var spentTime: Int;
    @objc dynamic var name: String;
    var exercises: List<ExerciseModel>;
    
    required init() {
        self.id = "\(UUID())";
        self.createdDate = Date();
        self.finishedDate = Date();
        self.exercises = List<ExerciseModel>();
        self.isInProgress = true;
        self.spentTime = 0;
        self.name = self.createdDate.toUserFriendlyString();
    }
    
    
    init(viewModel: TrainingDetailsViewModel) {
        self.id = viewModel.id;
        self.spentTime = viewModel.spentTime;
        self.isInProgress = viewModel.isInProgress;
        self.createdDate = viewModel.createdDate ?? Date();
        self.finishedDate = viewModel.finishedDate ?? Date();
        self.exercises = List<ExerciseModel>();
        self.name = viewModel.name;
        
        for exerciseViewModel in viewModel.exercises {
            self.exercises.append(ExerciseModel(viewModel: exerciseViewModel))
        }
    }
    
    override class func primaryKey() -> String? {
        return "id";
    }
}
