//
//  ExerciseLoopDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;

struct ExerciseLoopModel : Identifiable {
    var id: String?;
    var repeats: Int?;
    var weight: Int?;
    var exerciseId: String?;
}
