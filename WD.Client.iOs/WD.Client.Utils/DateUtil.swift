//
//  DateUtil.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 26.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

extension Date {
    public func toString(formatString: String = "MMM dd, yyyy") -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = formatString;
        
        return formatter.string(from: self);
    }
}
