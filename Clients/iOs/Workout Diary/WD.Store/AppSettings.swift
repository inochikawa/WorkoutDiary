//
//  AppSettings.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 21.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class AppSettings {
    @UserDefault("WD.enableICloudSync", defaultValue: true)
    var enableICloudSync: Bool;
    
    @UserDefault("WD.syncOnlyViaWiFi", defaultValue: true)
    var syncOnlyViaWiFi: Bool;
    
    enum Key {
        case iCloudSync, wifiSync
    }
}
