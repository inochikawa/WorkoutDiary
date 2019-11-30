//
//  TrainingsStore.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class TrainingsStore: ObservableObject {
    private var appStore: AppStore?;
    
    @Published var trainings: [TrainingListViewModel] = [];
    
    init(with hui: AppStore ) {
        self.appStore = hui;
        
        self.trainings = hui.data.map { TrainingListViewModel(model: $0) };
    }
    
    init() {
        self.trainings = [];
        self.appStore = nil;
    }
}
