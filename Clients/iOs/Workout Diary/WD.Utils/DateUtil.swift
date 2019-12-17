//
//  DateUtil.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 26.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

extension Date {
    public func toString(formatString: String = "dd MMM, yyyy HH:mm") -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = formatString;
        
        return formatter.string(from: self);
    }
    
    public func toUserFriendlyString() -> String {
        return "\(self.toString(formatString: "dd MMM, yyyy")) at \(self.toString(formatString: "HH:mm"))";
    }
    
    public func isToday() -> Bool {
        return Calendar.current.isDateInToday(self);
    }
    
    public func isYesterday() -> Bool {
        return Calendar.current.isDateInYesterday(self);
    }
    
    public func isOnThisWeek() -> Bool {
        return Calendar.current.isDateInWeekend(self);
    }
}
