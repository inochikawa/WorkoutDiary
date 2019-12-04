//
//  ExerciseDetails.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 26.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI

struct ExerciseDetails: View {
    @ObservedObject var exerciseItem: ExerciseViewModel;
    
    var onAddLoopClick: () -> Void;
    var onLoopEditClick: (ExerciseLoopViewModel) -> Void;
    
    @State private var isEditLoopClicked: Bool = false;
    @State private var isEditExerciseClicked: Bool = false;
    
    var body: some View {
        Section {
            VStack {
                ExerciseHeader(
                    exerciseName: self.exerciseItem.name ?? "",
                    totalLoops: self.exerciseItem.loopsCount,
                    onAddLoopClick: {
                        withAnimation(Animation.spring()) { self.onAddLoopClick() }
                    }
                )
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(self.exerciseItem.loops) { loopItem in
                            ExerciseLoop(
                                exerciseLoopItem: loopItem,
                                onLoopEditClick: {
                                    withAnimation(Animation.spring()) { self.onLoopEditClick(loopItem) }
                                }
                            )
                            
                        }
                    }
                }
            }
            .padding(.all, 12.0)
        }
        .background(Color("ExerciseItemBackgroundColor"))
        .background(Color.red)
        .cornerRadius(10)
        .padding(.all, 12.0)
        .shadow(color: Color("ExerciseItemBackgroundShadowColor"), radius: 20, x: 0, y: 15)
        .actionSheet(
            isPresented: self.$isEditLoopClicked,
            content: { return ActionSheet(title: Text("What next?"), message: Text("aaaa"), buttons: [
                .default(Text("Edit"), action: {}),
                .destructive(Text("Delete"), action: {})
            ])}
        )
    }
}


struct ExerciseDetails_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ExerciseDetails(exerciseItem: testTrainingDetails[0].exercises[0], onAddLoopClick: {}, onLoopEditClick: {i in })
        }
                .previewLayout(.fixed(width: 500, height: 600))
//        .environment(\.colorScheme, ColorScheme.dark)
    }
}

