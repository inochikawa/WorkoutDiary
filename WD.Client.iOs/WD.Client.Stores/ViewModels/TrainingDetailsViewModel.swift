//
//  TrainingDetailsViewModel.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

struct TrainingDetailsViewModel : Identifiable {
    var id: String;
    var createdDate:Date?;
    var exercises: [ExerciseViewModel] = [];
}
