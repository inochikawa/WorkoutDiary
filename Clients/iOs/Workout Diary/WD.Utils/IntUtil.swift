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

        return String(format: "%0.1dh %0.2dm %0.2ds",hours,minutes,seconds)
    }
}
