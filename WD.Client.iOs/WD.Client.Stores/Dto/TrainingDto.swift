//
//  TrainingDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;

struct TrainingDto : Identifiable {
    var id: String?;
    var createdDate:Date?;
    var exercises: [ExerciseDto] = [ExerciseDto]();
}

extension TrainingDto {
    public var exercisesCount: Int {
        get {
            return exercises != nil && exercises.count > 0 ? exercises.count : 0;
        }
    }
}
