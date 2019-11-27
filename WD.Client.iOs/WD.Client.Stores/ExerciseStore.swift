//
//  ExerciseStore.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 27.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//


import Foundation

class ExerciseStore: ObservableObject {
    @Published var exercises: [ExerciseDto] = [];
    
    public func reloadData(trainingId: String) {
        self.load(trainingId: trainingId) { items in
            self.exercises = items;
        };
    }
    
    public func load(trainingId: String, loadCallback: @escaping ([ExerciseDto]) -> Void) {
        DispatchQueue.main.async {
            let apiResult = Api.makeGetRequest(urlString: "exercise/byTrainingId/\(trainingId)");
            
            var resultList: [ExerciseDto] = [];
            
            switch apiResult {
            case .success(let result):
                let jsonArray = JsonUtil.toArrayOfDictionaries(jsonString: result ?? "");
                
                if jsonArray != nil {
                    for dict in jsonArray! {
                        var item = ExerciseDto();
                        
//                        var id: String?;
//                        var name: String?;
//                        var loops: [ExerciseLoopDto] = [ExerciseLoopDto]();
//                        var trainingId: String?;
                        
                        
                        if dict.keys.firstIndex(of: "id") != nil
                        {
                            item.id = (dict["id"] as! String);
                        }
                        if dict.keys.firstIndex(of: "name") != nil
                        {
                            item.id = (dict["name"] as! String);
                        }
                        if dict.keys.firstIndex(of: "trainingId") != nil
                        {
                            item.id = (dict["trainingId"] as! String);
                        }
                        if dict.keys.firstIndex(of: "loops") != nil
                        {
                            item.loops = (dict["loops"] as! [ExerciseLoopDto]);
                        }
                        
                        resultList.append(item);
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
