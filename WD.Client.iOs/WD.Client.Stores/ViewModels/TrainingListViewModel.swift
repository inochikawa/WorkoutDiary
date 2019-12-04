//
//  TrainingViewModel.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class TrainingListViewModel: Identifiable {
    var id: String = "";
    var date: Date = Date();
    var exercisesCount: Int = 0;
    
    init() {
        
    }
    
    init(id: String, date: Date) {
        self.id = id;
        self.date = date;
    }
    
    init(model: TrainingModel) {
        self.id = model.id ?? "";
        self.date = model.createdDate ?? Date();
        self.exercisesCount = model.exercises.count;
    }
}
