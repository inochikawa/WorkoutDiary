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
    @EnvironmentObject var trainingStore: TrainingsStore;
    
    @ObservedObject  var trainingItem: TrainingDetailsViewModel = TrainingDetailsViewModel();
    @ObservedObject private var selectedExerciseLoop: ExerciseLoopViewModel = ExerciseLoopViewModel();
    
    private var trainingId: String? = nil;
    
    @State private var isLoopModalDisplayed: Bool = false;
    @State private var isAddExerciseLoop: Bool = false;
    @State private var selectedExerciseName: String = "";
    @State private var selectedExerciseId: String = "";
    
    
    init(trainingItem: TrainingDetailsViewModel) {
        self.trainingItem = trainingItem;
    }
    
    init(trainingId: String?) {
        self.trainingId = trainingId;
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: HorizontalAlignment.leading) {
                TrainingDetailsTitle(
                    exercisesCount: trainingItem.exercisesCount,
                    onAddExerciseClick: {
                        self.trainingItem.exercises.append(ExerciseViewModel(id: "\(UUID())", name: "Test", loops: []));
                    }
                )
                Divider()
                if self.trainingItem.exercisesCount > 0 {
                    ScrollView{
                        ForEach(self.trainingItem.exercises) { exercise in
                            ExerciseDetails(
                                exerciseItem: exercise,
                                onAddLoopClick: {
                                    self.isAddExerciseLoop = true;
                                    self.selectedExerciseName = exercise.name ?? "";
                                    self.selectedExerciseId = exercise.id;
                                    self.isLoopModalDisplayed.toggle();
                                },
                                onLoopEditClick: { loopViewModel in
                                    self.isAddExerciseLoop = false;
                                    self.selectedExerciseName = exercise.name ?? "";
                                    self.selectedExerciseId = exercise.id;
                                    self.selectedExerciseLoop.copyFrom(viewModel: loopViewModel);
                                    self.isLoopModalDisplayed.toggle();
                                }
                            )
                        }
                    }
                } else {
                    Text("Nothing yet")
                    Spacer()
                }
            }.blur(radius: self.isLoopModalDisplayed ? 5 : 0)
            if self.isLoopModalDisplayed {
                LoopEditModal(
                    exercieName: self.selectedExerciseName,
                    repeats: self.$selectedExerciseLoop.repeats,
                    weight: self.$selectedExerciseLoop.weight,
                    onOkClick: {
                        self.isLoopModalDisplayed.toggle();

                        self.trainingItem.exercises.forEach { exerciseViewModel in
                            if exerciseViewModel.id == self.selectedExerciseId {
                                if self.isAddExerciseLoop {
                                    let newLoop = ExerciseLoopViewModel();
                                    newLoop.copyFrom(viewModel: self.selectedExerciseLoop);
                                    newLoop.id = "\(UUID())";

                                    exerciseViewModel.loops.append(newLoop);
                                } else {
                                    exerciseViewModel.loops.forEach { loopViewModel in
                                        if loopViewModel.id == self.selectedExerciseLoop.id {
                                            loopViewModel.copyFrom(viewModel: self.selectedExerciseLoop)
                                        }
                                    }
                                }
                            }
                        }
                    },
                    onCancelClick: {
                        self.isLoopModalDisplayed.toggle();
                    }
                )
            }
        }
        .navigationBarTitle("Training at \(self.trainingItem.createdDate?.toString() ?? "")", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.trainingStore.isEditMode.toggle()
        }) {
            Text(self.trainingStore.isEditMode ? "Done" : "Edit")
        })
        .onAppear(perform: {
            if self.trainingId == nil {
                self.trainingItem.id = "\(UUID())";
                self.trainingItem.createdDate = Date();
                self.trainingItem.exercises = [];
            } else {
                self.trainingItem.copyFrom(viewModel: self.trainingStore.getTrainingViewModelBy(id: self.trainingId!))
            }
        })
        .onDisappear(perform: {
            self.trainingStore.updateTraining(from: self.trainingItem);
        })
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
    var onAddExerciseClick: () -> Void;
    
    var body: some View {
        HStack {
            Text("Completed exercises: ")
            Text("\(exercisesCount)")
            Spacer()
            Button(action: {
                withAnimation(.spring()) { self.onAddExerciseClick() }
            }) {
                Image(systemName: "plus.square")
                    .font(.system(size: 26))
                    .frame(width: 30, height: 30, alignment: .center)
            }
        }
        .padding(.horizontal, 12)
        .padding(.top, 12)
        .font(.title)
    }
}

