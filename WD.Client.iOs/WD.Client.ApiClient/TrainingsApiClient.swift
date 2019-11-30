//
//  TrainingsApiClient.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class TrainingsApiClient {
    
    public static func loadAll(loadCallback: @escaping ([TrainingModel]) -> Void) {
        DispatchQueue.main.async {
            let apiResult = Api.makeGetRequest(urlString: "training");
            
            var resultList: [TrainingModel] = [];
            
            switch apiResult {
            case .success(let result):
                let jsonArray = JsonUtil.toArrayOfDictionaries(jsonString: result ?? "");
                
                
                if jsonArray != nil {
                    for dict in jsonArray! {
                        resultList.append(TrainingModel.mapFromDictionary(dictionary: dict));
                    }
                    
                    loadCallback(resultList);
                }
                
                break;
            case .failure(let error):
                print("Error loading trainigns: \(error)");
                break;
            }
        }
    }
    
    public static func loadBy(id: String, loadCallback: @escaping (TrainingModel) -> Void) {
        DispatchQueue.main.async {
            let apiResult = Api.makeGetRequest(urlString: "training");
            
            switch apiResult {
            case .success(let result):
                let dict = JsonUtil.toDictionary(jsonString: result ?? "");
                
                if dict != nil {
                    loadCallback(TrainingModel.mapFromDictionary(dictionary: dict!));
                }
                
                break;
            case .failure(let error):
                print("Error loading trainigns: \(error)");
                break;
            }
        }
    }
    
}
