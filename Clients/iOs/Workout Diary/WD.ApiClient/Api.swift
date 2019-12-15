//
//  Api.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

public class Api {
    private static var _baseUrl: String {
        // TODO: move initialization of base URL to constructor.
        // Use DI.
        return "http://localhost:8000/api/v1/";
    }
    
    
    /// Make HTTP GET request
    /// Note: This blocks execution thread!
    /// - Parameters:
    ///   - url: target url
    ///   - params: dictionary that represent query string
    public static func makeGetRequest(urlString: String, params: [String: String]? = nil) -> Result<String?, Error> {
        
        var queryString = "";
        
        // read params and make a query string from dictionary values
        if params != nil {
            var counter = 0;
            for (key, value) in params! {
                if counter == 0 {
                    queryString += "?";
                }
                queryString += "\(key)=\(value)";
                
                if counter != params!.count - 1 {
                    queryString += "&";
                }
                
                counter += 1;
            }
        }
        
        let requestUrl = URL(string: self._baseUrl + urlString + queryString)!;
        
        var result: Result<String?, Error>!;
        let simaphore = DispatchSemaphore(value: 0);
        
        URLSession.shared.dataTask(with: requestUrl) {(data, response, error) in
            if let data = data {
                let jsonString = String(data: data, encoding: .utf8)!;
                result = Result.success(jsonString);
            } else {
                result = Result.failure(error!);
            }
            simaphore.signal();
        }.resume();
        
        // Here we block thread!
        simaphore.wait();
        
        return result;
    }
}
