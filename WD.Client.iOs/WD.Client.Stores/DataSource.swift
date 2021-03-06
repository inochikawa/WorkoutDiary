//
//  TrainingsManager.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class DataSource {
    var data: [TrainingModel] = [];
    
    init() {
    }
    
    public func reloadData(forceReload: Bool = false, onLoad: @escaping ([TrainingModel]) -> Void)  {
        if forceReload {
            TrainingsApiClient.loadAll { items in
                self.data = items;
                onLoad(items);
            };
        } else {
            onLoad(self.data);
        }
    }
    
    public func getTrainingBy(id: String) -> TrainingModel? {
        return self.data.filter { i in return i.id == id }.first;
    }
    
    public func printInfo() {
        self.data.forEach {
            i in
            print("ID: \(i.id)")
        }
    }
}
