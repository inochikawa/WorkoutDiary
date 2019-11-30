//
//  ExerciseViewModel.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 30.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

struct ExerciseViewModel : Identifiable {
    var id: String;
    var name: String?;
    var loops: [ExerciseLoopViewModel] = [];
}
