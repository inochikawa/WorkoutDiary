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

struct ExerciseHeader_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseHeader(exerciseName: "Pepka", totalLoops: 10)
    }
}
