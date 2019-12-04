//
//  ExerciseLoopEditModal.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 03.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import SwiftUI

struct LoopEditModal: View {
    var exercieName: String;
    
    @Binding var repeats: Int;
    @Binding var weight: Int;
    
    @State private var _weightStep: Int = 5;
    
    var onOkClick: () -> Void;
    var onCancelClick: () -> Void;
    
    var body: some View {
        ZStack {
            Color(.black)
//                .frame(width: 500, height: 500, alignment: .center)
                .opacity(0.15)
                .blur(radius: 20)
            
            Section {
                VStack {
                    Text(self.exercieName).padding(.top, 20)
                    
                    VStack (alignment: .leading) {
                        Text("Weight step")
                            .font(.system(size: 10))
                            .foregroundColor(Color.gray)
                        Picker(selection: self.$_weightStep, label: EmptyView()) {
                            Text("1 kg").tag(1)
                            Text("5 kg").tag(5)
                            Text("10 kg").tag(10)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
                    VStack {
                        Stepper("Weight: \(self.weight) kg", value: self.$weight, in: 0...300, step: self._weightStep)
                        Divider()
                            .padding(0)
                        Stepper("Repeats \(self.repeats)", value: self.$repeats, in: 1...500, step: 1)
                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        
                        WDWarningButton(title: "Cancel", onClick: {
                            withAnimation(Animation.spring()) { self.onCancelClick() }
                        })
                        
                        Spacer()
                        
                        WDPrimayButton(title: "Ok", onClick: {
                            withAnimation(Animation.spring()) { self.onOkClick() }
                        })
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                }
            }
            .frame(width: 270, alignment: .center)
            .background(Color("ExerciseItemBackgroundColor"))
            .cornerRadius(12)
        }
//        .frame(width: CGFloat.infinity, height: CGFloat.infinity)
    }
}


