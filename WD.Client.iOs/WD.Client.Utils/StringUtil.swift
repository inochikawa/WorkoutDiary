//
//  StringUtil.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 03.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation

extension String {
    public func equalsIgnoreCase(val: String) -> Bool {
        return self.caseInsensitiveCompare(val) == .orderedSame;
    }
}
