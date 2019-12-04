//
//  ExerciseHeader.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 29.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI

struct ExerciseHeader: View {
    var exerciseName: String;
    var totalLoops: Int;
    
    var onAddLoopClick: () -> Void;
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(self.exerciseName)
                    .font(.system(size: 20))
                    .fontWeight(.light)

                Text("Total loops: \(self.totalLoops)")
                    .font(.system(size: 12))
                    .fontWeight(.light)
            }
            Spacer()
            Button(action: {
                self.onAddLoopClick();
            }) {
                Image(systemName: "plus.square")
                    .font(.system(size: 26))
                    .frame(width: 30, height: 30, alignment: .center)
            }
        }
    }
}

struct ExerciseHeader_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseHeader(exerciseName: "Pepka", totalLoops: 10, onAddLoopClick: {})
    }
}
