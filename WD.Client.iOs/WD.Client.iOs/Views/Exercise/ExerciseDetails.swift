//
//  ExerciseDetails.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 26.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI

struct ExerciseDetails: View {
    var exerciseItem: ExerciseModel;

    
    var body: some View {
        Section {
            VStack {
                ExerciseHeader(exerciseName: self.exerciseItem.name ?? "", totalLoops: self.exerciseItem.loopsCount)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(self.exerciseItem.loops) { loopItem in
                            ExerciseLoop(exerciseLoopItem: loopItem)
                        }
                    }
                }
            }
            .padding(.all, 12.0)
        }
        .background(Color("ExerciseItemBackgroundColor"))
            .cornerRadius(10)
            .padding(.all, 12.0)
            .shadow(color: Color("ExerciseItemBackgroundShadowColor"), radius: 12, x: 0, y: 18)
    }
}


struct ExerciseDetails_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ExerciseDetails(exerciseItem: testData[0].exercises[0])
            ExerciseDetails(exerciseItem: testData[0].exercises[1])
            ExerciseDetails(exerciseItem: testData[0].exercises[2])
        }
                .previewLayout(.fixed(width: 500, height: 600))
//        .environment(\.colorScheme, ColorScheme.dark)
    }
}

