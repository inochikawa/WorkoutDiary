//
//  ContentView.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello Maxim")
                .multilineTextAlignment(.center)
                .foregroundColor(.red);
            DatePicker(selection: .constant(Date()), label: { Text("Date") })
            Text("Goodbye Maxim");
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
