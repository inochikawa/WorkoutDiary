//
//  TestData.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 27.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation


#if DEBUG
var testData: [TrainingModel] = [
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
        ExerciseModel(id: "21", name: "Test 21", trainingId: "2"),
        ExerciseModel(id: "22", name: "Test 22", trainingId: "2"),
        ExerciseModel(id: "23", name: "Test 23", trainingId: "2")
    ])
];

var testTrainingDetails: [TrainingDetailsViewModel] = [
    
    TrainingDetailsViewModel(id: "1", createdDate: Date(), exercises: [
        ExerciseViewModel(id: "11", name: "Test 11", loops: [
            ExerciseLoopViewModel(id: "111", repeats: 3, weight: 12),
            ExerciseLoopViewModel(id: "112", repeats: 2, weight: 24),
            ExerciseLoopViewModel(id: "113", repeats: 2, weight: 20),
            ExerciseLoopViewModel(id: "114", repeats: 1, weight: 15),
            ExerciseLoopViewModel(id: "115", repeats: 5, weight: 5),
        ]),
        ExerciseViewModel(id: "12", name: "Test 12", loops: [
            ExerciseLoopViewModel(id: "121", repeats: 3, weight: 12),
            ExerciseLoopViewModel(id: "122", repeats: 2, weight: 24),
            ExerciseLoopViewModel(id: "123", repeats: 2, weight: 20),
            ExerciseLoopViewModel(id: "124", repeats: 1, weight: 15),
            ExerciseLoopViewModel(id: "125", repeats: 5, weight: 5),
        ]),
        ExerciseViewModel(id: "13", name: "Test 13", loops: [
            ExerciseLoopViewModel(id: "131", repeats: 3, weight: 12),
            ExerciseLoopViewModel(id: "132", repeats: 2, weight: 24),
            ExerciseLoopViewModel(id: "133", repeats: 2, weight: 20),
            ExerciseLoopViewModel(id: "134", repeats: 1, weight: 15),
            ExerciseLoopViewModel(id: "135", repeats: 5, weight: 5),
        ])
    ])
    
];

var testTrainingsLists: [TrainingListViewModel] = [

    TrainingListViewModel(id: "1", date: Date()),
    TrainingListViewModel(id: "2", date: Date()),
    TrainingListViewModel(id: "3", date: Date()),
    TrainingListViewModel(id: "4", date: Date()),

];

#endif
