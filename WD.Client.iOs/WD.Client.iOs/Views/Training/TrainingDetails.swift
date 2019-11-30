//
//  TrainingDetails.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 26.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI
import Resolver

struct TrainingDetails: View {
    var trainingItem: TrainingDetailsViewModel;
    var trainingStore: TrainingsStore;
    
    init(trainingItem: TrainingDetailsViewModel) {
        self.trainingStore = Resolver.resolve();
        self.trainingItem = trainingItem;
    }
    
    init(trainingId: String) {
        self.trainingStore = Resolver.resolve();
        self.trainingItem = self.trainingStore.getTrainingViewModelBy(id: trainingId);
    }

    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            TrainingDetailsTitle(exercisesCount: trainingItem.exercisesCount)
            Divider()
            ScrollView{
                ForEach(self.trainingItem.exercises) { exercise in
                    ExerciseDetails(exerciseItem: exercise)
                }
            }
        }
        .navigationBarTitle("Training at \(self.trainingItem.createdDate?.toString() ?? "")", displayMode: .inline)
    }
}

struct TrainingDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrainingDetails(trainingItem: testTrainingDetails[0])
        }
    }
}

struct TrainingDetailsTitle: View {
    var exercisesCount: Int = 0;
    
    var body: some View {
        HStack {
            Text("Completed exercises: ")
            Text("\(exercisesCount)")
        }
        .padding(.horizontal, 12)
        .padding(.top, 12)
        .font(.title)
    }
}
