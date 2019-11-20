//
//  TrainingsManager.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class TrainingsManager {
    var trainings: [TrainingDto] = [];
    
    public func loadAll() {
        DispatchQueue.global(qos: .background).async {
            let apiResult = Api.makeGetRequest(urlString: "training");
            
            switch apiResult {
            case .success(let result):
                let jsonArray = JsonUtil.toArrayOfDictionaries(jsonString: result ?? "");

                let dateFormatter = ISO8601DateFormatter();
                
                if jsonArray != nil {
                    for dict in jsonArray! {
                        var item = TrainingDto();
                        if dict.keys.firstIndex(of: "createdDate") != nil
                        {
                            item.createdDate = dateFormatter.date(from:dict["createdDate"] as! String)!;
                        }
                        
                        if dict.keys.firstIndex(of: "id") != nil
                        {
                            item.id = (dict["id"] as! String);
                        }
                        
                        self.trainings.append(item);
                    }
                }
                
                break;
            case .failure(let error):
                print("Error loading trainigns: \(error)");
                break;
            }
        }
    }
}
