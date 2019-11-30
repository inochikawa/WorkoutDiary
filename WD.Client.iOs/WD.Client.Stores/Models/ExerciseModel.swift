//
//  ExerciseDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;

struct ExerciseModel : Identifiable {
    var id: String?;
    var name: String?;
    var loops: [ExerciseLoopModel] = [ExerciseLoopModel]();
    var trainingId: String?;
}
