//
//  TrainingModelExtention.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

extension TrainingModel {

    public static func mapFrom(dictionary: Dictionary<String, Any>) -> TrainingModel {
        let item = TrainingModel();
        if dictionary.keys.firstIndex(of: "createdDate") != nil
        {
            let dateFormatter = ISO8601DateFormatter();
            item.createdDate = dateFormatter.date(from:dictionary["createdDate"] as! String)!;
        }
        
        if dictionary.keys.firstIndex(of: "id") != nil
        {
            item.id = (dictionary["id"] as! String);
        }

        if dictionary.keys.firstIndex(of: "exercises") != nil
        {
            let exerciseDicts = (dictionary["exercises"] as! [Dictionary<String, Any>]);
            
            for exerciseDictItem in exerciseDicts {
                item.exercises.append(ExerciseModel.mapFromDictionary(dictionary: exerciseDictItem));
            }
        }
        
        return item;
    }

}
