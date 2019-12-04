//
//  ExerciseLoop.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI

struct ExerciseLoop: View {
    @ObservedObject var exerciseLoopItem: ExerciseLoopViewModel;
    @EnvironmentObject var store: TrainingsStore;
    
    var onLoopEditClick: () -> Void;
    
    var body: some View {
        HStack{
            VStack {
                Text("\(self.exerciseLoopItem.weight) kg")
                Divider()
                Text("\(self.exerciseLoopItem.repeats)")
            }
            .frame(width: 80, alignment: .center)
            if self.store.isEditMode {
                VStack {
                    Button(action: {
                        self.onLoopEditClick();
                    }) {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "trash")
                        .foregroundColor(.red)
                    }
                }
            }
        }
        .padding(.all, 12)
    }
}

struct ExerciseLoop_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseLoop(exerciseLoopItem: testTrainingDetails[0].exercises[0].loops[0], onLoopEditClick: {})
    }
}
