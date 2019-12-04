//
//  WDButton.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 02.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import SwiftUI

struct WDButton: View {
    var title: String;
    var onClick: () -> Void;
    
    var foregroundColor: Color = Color.black;
    var backgroundColor: Color = Color.white;
    
    var body: some View {
        Button(action: { self.onClick() }) {
            Text(self.title)
                .fontWeight(.bold)
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .foregroundColor(self.foregroundColor)
            
        }
        .background(self.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .shadow(radius: 2)
    }
}
