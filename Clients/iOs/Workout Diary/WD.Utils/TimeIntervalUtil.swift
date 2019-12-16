//
//  TimeIntervalUtil.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 16.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

extension TimeInterval{

    func toFormattedString() -> String {

        let time = NSInteger(self)

        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)

        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
}
