//
//  TrainingsManager.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class TrainingsStore: ObservableObject {
    @Published var trainings: [TrainingDto] = [];
    
    init() {
        self.reloadData();
    }
    
    public func reloadData() {
        self.loadAll { items in
            self.trainings = items;
        };
        
    }
    
    public func loadAll(loadCallback: @escaping ([TrainingDto]) -> Void) {
        DispatchQueue.main.async {
            let apiResult = Api.makeGetRequest(urlString: "training");
            
            var resultList: [TrainingDto] = [];
            
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

                        if dict.keys.firstIndex(of: "exercises") != nil
                        {
                            let exerciseDicts = (dict["exercises"] as! [Dictionary<String, Any>]);
                            
                            for exerciseDictItem in exerciseDicts {
                                var exerciseItem = ExerciseDto();
                                
                                if exerciseDictItem.keys.firstIndex(of: "id") != nil
                                {
                                    exerciseItem.id = (exerciseDictItem["id"] as! String);
                                }
                                if exerciseDictItem.keys.firstIndex(of: "name") != nil
                                {
                                    exerciseItem.name = (exerciseDictItem["name"] as! String);
                                }
                                if exerciseDictItem.keys.firstIndex(of: "trainingId") != nil
                                {
                                    exerciseItem.trainingId = (exerciseDictItem["trainingId"] as! String);
                                }
                                if exerciseDictItem.keys.firstIndex(of: "loops") != nil
                                {
                                    let exerciseLoopDicts = (exerciseDictItem["loops"] as! [Dictionary<String, Any>]);
                                    
                                    for exerciseLoopDictItem in exerciseLoopDicts {
                                        var exerciseLoopItem = ExerciseLoopDto();
                                        
                                        if exerciseLoopDictItem.keys.firstIndex(of: "id") != nil
                                        {
                                            exerciseLoopItem.id = (exerciseLoopDictItem["id"] as! String);
                                        }
                                        if exerciseLoopDictItem.keys.firstIndex(of: "weight") != nil
                                        {
                                            exerciseLoopItem.weight = (exerciseLoopDictItem["weight"] as! Int);
                                        }
                                        if exerciseLoopDictItem.keys.firstIndex(of: "repeats") != nil
                                        {
                                            exerciseLoopItem.repeats = (exerciseLoopDictItem["repeats"] as! Int);
                                        }
                                        if exerciseLoopDictItem.keys.firstIndex(of: "exerciseId") != nil
                                        {
                                            exerciseLoopItem.exerciseId = (exerciseLoopDictItem["exerciseId"] as! String);
                                        }
                                        
                                        exerciseItem.loops.append(exerciseLoopItem);
                                    }
                                }
                                
                                item.exercises.append(exerciseItem);
                            }
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
    
    public func loadBy(id: String, loadCallback: @escaping (TrainingDto) -> Void) {
        DispatchQueue.main.async {
            let apiResult = Api.makeGetRequest(urlString: "training");
            
            switch apiResult {
            case .success(let result):
                let dict = JsonUtil.toDictionary(jsonString: result ?? "");
                
                let dateFormatter = ISO8601DateFormatter();
                
                if dict != nil {
                    var item = TrainingDto();
                    if dict!.keys.firstIndex(of: "createdDate") != nil
                    {
                        item.createdDate = dateFormatter.date(from:dict!["createdDate"] as! String)!;
                    }
                    
                    if dict!.keys.firstIndex(of: "id") != nil
                    {
                        item.id = (dict!["id"] as! String);
                    }
                    if dict!.keys.firstIndex(of: "exercises") != nil
                    {
                        item.exercises = (dict!["exercises"] as! [ExerciseDto]);
                    }
                    
                    loadCallback(item);
                }
                
                break;
            case .failure(let error):
                print("Error loading trainigns: \(error)");
                break;
            }
        }
    }
}
