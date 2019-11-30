//
//  ExerciseLoop.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI

struct ExerciseLoop: View {
    var exerciseLoopItem: ExerciseLoopModel;
    
    var body: some View {
        VStack {
            Text("\(self.exerciseLoopItem.weight!) kg")
            Divider()
            Text("\(self.exerciseLoopItem.repeats!)")
        }
        .frame(width: 80, alignment: .center)
    }
}

struct ExerciseLoop_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseLoop(exerciseLoopItem: testData[0].exercises[0].loops[0])
    }
}
