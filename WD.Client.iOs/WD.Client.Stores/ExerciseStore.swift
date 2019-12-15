//
//  ExerciseStore.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 27.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//


import Foundation

class ExerciseStore: ObservableObject {
    @Published var exercises: [ExerciseModel] = [];
    
    public func reloadData(trainingId: String) {
        self.load(trainingId: trainingId) { items in
            self.exercises = items;
        };
    }
    
    public func load(trainingId: String, loadCallback: @escaping ([ExerciseModel]) -> Void) {
        DispatchQueue.main.async {
            let apiResult = Api.makeGetRequest(urlString: "exercise/byTrainingId/\(trainingId)");
            
            var resultList: [ExerciseModel] = [];
            
            switch apiResult {
            case .success(let result):
                let jsonArray = JsonUtil.toArrayOfDictionaries(jsonString: result ?? "");
                
                if jsonArray != nil {
                    for dict in jsonArray! {
                        resultList.append(ExerciseModel.mapFromDictionary(dictionary: dict));
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
}
