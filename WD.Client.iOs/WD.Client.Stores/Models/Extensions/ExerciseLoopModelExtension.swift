//
//  ExerciseLoopModelExtension.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

extension ExerciseLoopModel {
    public static func mapFromDictionary(dictionary: Dictionary<String, Any>) -> ExerciseLoopModel {
        var exerciseLoopItem = ExerciseLoopModel();
        
        if dictionary.keys.firstIndex(of: "id") != nil
        {
            exerciseLoopItem.id = (dictionary["id"] as! String);
        }
        if dictionary.keys.firstIndex(of: "weight") != nil
        {
            exerciseLoopItem.weight = (dictionary["weight"] as! Int);
        }
        if dictionary.keys.firstIndex(of: "repeats") != nil
        {
            exerciseLoopItem.repeats = (dictionary["repeats"] as! Int);
        }
        if dictionary.keys.firstIndex(of: "exerciseId") != nil
        {
            exerciseLoopItem.exerciseId = (dictionary["exerciseId"] as! String);
        }
        
        return exerciseLoopItem;
    }
}
