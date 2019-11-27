//
//  ExerciseDetails.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 26.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI

struct ExerciseDetails: View {
    var exerciseItem: ExerciseDto;
    
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
        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 1.0))
            //                .border(Color.yellow, width: 1)
            .cornerRadius(10)
            .padding(.all, 12.0)
            .shadow(color: Color(white: 0.95), radius: 12, x: 0, y: 18)
    }
}

struct ExerciseHeader: View {
    var exerciseName: String;
    var totalLoops: Int;
    
    var body: some View {
        HStack {
            Text(self.exerciseName)
                .font(.system(size: 20))
                .fontWeight(.light)
            Spacer()
            Text("Total loops: \(self.totalLoops)")
                .font(.system(size: 12))
                .fontWeight(.light)
        }
    }
}

struct ExerciseLoop: View {
    var exerciseLoopItem: ExerciseLoopDto;
    
    var body: some View {
        VStack {
            Text("\(self.exerciseLoopItem.weight!) kg")
            Divider()
            Text("\(self.exerciseLoopItem.repeats!)")
        }
        .frame(width: 80, alignment: .center)
    }
}

struct ExerciseDetails_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ExerciseDetails(exerciseItem: testData[0].exercises[0])
            ExerciseDetails(exerciseItem: testData[0].exercises[1])
            ExerciseDetails(exerciseItem: testData[0].exercises[2])
        }
        //        .previewLayout(.fixed(width: 300, height: 70))
    }
}

