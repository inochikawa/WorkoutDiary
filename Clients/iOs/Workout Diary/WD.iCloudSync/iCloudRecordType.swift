//
//  iCloudRecordTypes.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 19.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

struct ICloudRecordType {
    
    struct Training {
        public static let typeName = "TrainingEntity";
        
        public static let id = "id";
        public static let createdDate = "createdDate";
        public static let finishedDate = "finishedDate";
        public static let isInProgress = "isInProgress";
        public static let spentTime = "spentTime"
        public static let name = "name";
        
        // list of strings = list of json objects
        public static let exercises = "exercises";
    }
    
    struct Exercise {
        public static let typeName = "ExerciseEntity";
        
        public static let id = "id";
        public static let trainingId = "trainingId";
        public static let name = "name";
    }
    
    struct ExerciseLoop {
        public static let typeName = "ExerciseLoopEntity";
        
        public static let id = "id";
        public static let weight = "weight";
        public static let repeats = "repeats";
        public static let exerciseId = "exerciseId";
    }
}
