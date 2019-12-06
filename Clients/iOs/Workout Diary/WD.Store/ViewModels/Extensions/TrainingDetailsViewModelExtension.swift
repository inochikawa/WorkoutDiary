//
//  TrainingDetailsViewModelExtension.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 30.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

extension TrainingDetailsViewModel {
    
    public var exercisesCount: Int {
        get {
            return exercises.count;
        }
    }
    
}
