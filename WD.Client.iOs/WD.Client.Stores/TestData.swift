//
//  TestData.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 27.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation


#if DEBUG
var testData: [TrainingDto] = [
    TrainingDto(id: "1", createdDate: Date(), exercises: [
        ExerciseDto(id: "11", name: "Test 11", loops: [
            ExerciseLoopDto(id: "111", repeats: 3, weight: 12, exerciseId: "11"),
            ExerciseLoopDto(id: "112", repeats: 2, weight: 24, exerciseId: "11"),
            ExerciseLoopDto(id: "113", repeats: 2, weight: 20, exerciseId: "11"),
            ExerciseLoopDto(id: "114", repeats: 1, weight: 15, exerciseId: "11"),
            ExerciseLoopDto(id: "115", repeats: 5, weight: 5, exerciseId: "11"),
        ], trainingId: "1"),
        ExerciseDto(id: "12", name: "Test 12", loops: [
            ExerciseLoopDto(id: "121", repeats: 3, weight: 12, exerciseId: "12"),
            ExerciseLoopDto(id: "122", repeats: 2, weight: 24, exerciseId: "12"),
            ExerciseLoopDto(id: "123", repeats: 2, weight: 20, exerciseId: "12"),
            ExerciseLoopDto(id: "124", repeats: 1, weight: 15, exerciseId: "12"),
            ExerciseLoopDto(id: "125", repeats: 5, weight: 5, exerciseId: "12"),
        ], trainingId: "1"),
        ExerciseDto(id: "13", name: "Test 13", loops: [
            ExerciseLoopDto(id: "131", repeats: 3, weight: 12, exerciseId: "13"),
            ExerciseLoopDto(id: "132", repeats: 2, weight: 24, exerciseId: "13"),
            ExerciseLoopDto(id: "133", repeats: 2, weight: 20, exerciseId: "13"),
            ExerciseLoopDto(id: "134", repeats: 1, weight: 15, exerciseId: "13"),
            ExerciseLoopDto(id: "135", repeats: 5, weight: 5, exerciseId: "13"),
        ], trainingId: "1")
    ]),
    TrainingDto(id: "2", createdDate: Date(), exercises: [
        ExerciseDto(id: "21", name: "Test 21", trainingId: "2"),
        ExerciseDto(id: "22", name: "Test 22", trainingId: "2"),
        ExerciseDto(id: "23", name: "Test 23", trainingId: "2")
    ])
];
#endif
