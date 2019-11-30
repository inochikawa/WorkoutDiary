//
//  TrainingsManager.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class AppStore: ObservableObject {
    @Published var data: [TrainingModel] = [];
    
    init() {
        self.reloadData();
    }
    
    public func reloadData() {
        TrainingsApiClient.loadAll { items in
            self.data = items;
            self.resortTrainings();
        };
        
    }
    
    public func createNewTraining() {
        self.data.append(TrainingModel());
        self.resortTrainings();
    }
    
    public func resortTrainings() {
        self.data = self.data.sorted(by: {
            (a, b) in
            if a.createdDate == nil || b.createdDate == nil {
                return true;
            }
            
            return b.createdDate! < a.createdDate!;
        });
    }
}
