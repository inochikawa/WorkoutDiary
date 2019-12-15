//
//  TestDataSourse.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 05.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

let testData: [TrainingModel] = [
    TrainingModel(id: "1", createdDate: Date(), exercises: [
        ExerciseModel(id: "11", name: "Test 11", loops: [
            ExerciseLoopModel(id: "111", repeats: 3, weight: 12, exerciseId: "11"),
            ExerciseLoopModel(id: "112", repeats: 2, weight: 24, exerciseId: "11"),
            ExerciseLoopModel(id: "113", repeats: 2, weight: 20, exerciseId: "11"),
            ExerciseLoopModel(id: "114", repeats: 1, weight: 15, exerciseId: "11"),
            ExerciseLoopModel(id: "115", repeats: 5, weight: 5, exerciseId: "11"),
        ], trainingId: "1"),
        ExerciseModel(id: "12", name: "Test 12", loops: [
            ExerciseLoopModel(id: "121", repeats: 3, weight: 12, exerciseId: "12"),
            ExerciseLoopModel(id: "122", repeats: 2, weight: 24, exerciseId: "12"),
            ExerciseLoopModel(id: "123", repeats: 2, weight: 20, exerciseId: "12"),
            ExerciseLoopModel(id: "124", repeats: 1, weight: 15, exerciseId: "12"),
            ExerciseLoopModel(id: "125", repeats: 5, weight: 5, exerciseId: "12"),
        ], trainingId: "1"),
        ExerciseModel(id: "13", name: "Test 13", loops: [
            ExerciseLoopModel(id: "131", repeats: 3, weight: 12, exerciseId: "13"),
            ExerciseLoopModel(id: "132", repeats: 2, weight: 24, exerciseId: "13"),
            ExerciseLoopModel(id: "133", repeats: 2, weight: 20, exerciseId: "13"),
            ExerciseLoopModel(id: "134", repeats: 1, weight: 15, exerciseId: "13"),
            ExerciseLoopModel(id: "135", repeats: 5, weight: 5, exerciseId: "13"),
        ], trainingId: "1")
    ]),
    
    TrainingModel(id: "2", createdDate: Date(), exercises: [
            ExerciseModel(id: "21", name: "Test 21", loops: [
                ExerciseLoopModel(id: "211", repeats: 3, weight: 12, exerciseId: "21"),
                ExerciseLoopModel(id: "212", repeats: 2, weight: 24, exerciseId: "21"),
                ExerciseLoopModel(id: "213", repeats: 2, weight: 20, exerciseId: "21"),
                ExerciseLoopModel(id: "214", repeats: 1, weight: 15, exerciseId: "21"),
                ExerciseLoopModel(id: "215", repeats: 5, weight: 5, exerciseId: "21"),
            ], trainingId: "2"),
            ExerciseModel(id: "22", name: "Test 22", loops: [
                ExerciseLoopModel(id: "221", repeats: 3, weight: 12, exerciseId: "22"),
                ExerciseLoopModel(id: "222", repeats: 2, weight: 24, exerciseId: "22"),
                ExerciseLoopModel(id: "223", repeats: 2, weight: 20, exerciseId: "22"),
                ExerciseLoopModel(id: "224", repeats: 1, weight: 15, exerciseId: "22"),
                ExerciseLoopModel(id: "225", repeats: 5, weight: 5, exerciseId: "22"),
            ], trainingId: "2"),
            ExerciseModel(id: "23", name: "Test 23", loops: [
                ExerciseLoopModel(id: "231", repeats: 3, weight: 12, exerciseId: "23"),
                ExerciseLoopModel(id: "232", repeats: 2, weight: 24, exerciseId: "23"),
                ExerciseLoopModel(id: "233", repeats: 2, weight: 20, exerciseId: "23"),
                ExerciseLoopModel(id: "234", repeats: 1, weight: 15, exerciseId: "23"),
                ExerciseLoopModel(id: "235", repeats: 5, weight: 5, exerciseId: "23"),
            ], trainingId: "2")
        ])
];
