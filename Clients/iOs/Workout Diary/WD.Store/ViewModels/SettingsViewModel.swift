//
//  SettingsViewModel.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 21.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

class SettingSection {
    var header: String = "";
    var settings: [SettingItemViewModel] = [];
    
    init(header: String, settings: [SettingItemViewModel]) {
        self.header = header;
        self.settings = settings;
    }
}

class SettingItemViewModel {
    var title: String = "";
    var key: AppSettings.Key;
    var isOn: Bool = true;
    var onSettingChange: (_ newValue: Bool) -> Void;
    
    init(title: String, key: AppSettings.Key, isOn: Bool, onSettingChange: @escaping (_ newValue: Bool) -> Void) {
        self.title = title;
        self.key = key;
        self.isOn = isOn;
        self.onSettingChange = onSettingChange;
    }
}
