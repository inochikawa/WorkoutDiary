//
//  WDPrimaryButton.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 02.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import SwiftUI

struct WDPrimayButton: View {
    var title: String;
    var onClick: () -> Void;
    
    var body: some View {
        WDButton(
            title: self.title,
            onClick: {self.onClick()},
            foregroundColor: .white,
            backgroundColor: .blue
        )
    }
}
