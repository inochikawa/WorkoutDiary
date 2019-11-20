//
//  JsonUtil.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class JsonUtil {
    public static func toDictionary(jsonString: String) -> Dictionary<String, Any>? {
        let data = jsonString.data(using: .utf8)!;
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String, Any>
            {
                print(json); // use the json here
                return json;
            } else {
                print("bad json")
            }
        } catch let error as NSError {
            print(error)
        }
        
        return nil;
    }
    
    public static func toArrayOfDictionaries(jsonString: String) -> [Dictionary<String, Any>]? {
        let data = jsonString.data(using: .utf8)!;
        
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String, Any>]
            {
                print(jsonArray); // use the json here
                return jsonArray;
            } else {
                print("bad json")
            }
        } catch let error as NSError {
            print(error)
        }
        
        return nil;
    }
}
