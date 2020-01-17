//
//  IntUtil.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 16.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

extension Int {
    func toTimeString() -> String {
        let seconds = self % 60
        let minutes = (self / 60) % 60
        let hours = (self / 3600)
        
        let timeStringFormat = "%.1d" + NSLocalizedString(ConstantData.LocalizeName.Hours, comment: "")
        + " %.2d" + NSLocalizedString(ConstantData.LocalizeName.Minutes, comment: "")
        + " %.2d" + NSLocalizedString(ConstantData.LocalizeName.Seconds, comment: "");

        return String(format: timeStringFormat, hours, minutes, seconds)
    }
}
