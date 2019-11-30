//
//  ExerciseModelExtension.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

extension ExerciseModel {
    
    public static func mapFromDictionary(dictionary: Dictionary<String, Any>) -> ExerciseModel {
        var exerciseItem = ExerciseModel();
        
        if dictionary.keys.firstIndex(of: "id") != nil
        {
            exerciseItem.id = (dictionary["id"] as! String);
        }
        if dictionary.keys.firstIndex(of: "name") != nil
        {
            exerciseItem.name = (dictionary["name"] as! String);
        }
        if dictionary.keys.firstIndex(of: "trainingId") != nil
        {
            exerciseItem.trainingId = (dictionary["trainingId"] as! String);
        }
        if dictionary.keys.firstIndex(of: "loops") != nil
        {
            let exerciseLoopDicts = (dictionary["loops"] as! [Dictionary<String, Any>]);
            
            for exerciseLoopDictItem in exerciseLoopDicts {
                exerciseItem.loops.append(ExerciseLoopModel.mapFromDictionary(dictionary: exerciseLoopDictItem));
            }
        }
        
        return exerciseItem;
    }
}
