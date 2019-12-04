//
//  TestData.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 27.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation


#if DEBUG

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
