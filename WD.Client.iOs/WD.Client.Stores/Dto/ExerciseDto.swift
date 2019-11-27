//
//  ExerciseDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;

struct ExerciseDto : Identifiable {
    var id: String?;
    var name: String?;
    var loops: [ExerciseLoopDto] = [ExerciseLoopDto]();
    var trainingId: String?;
}


extension ExerciseDto {
    public var loopsCount: Int {
        get {
            return loops != nil && loops.count > 0 ? loops.count : 0;
        }
    }
}
