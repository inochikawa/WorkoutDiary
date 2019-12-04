//
//  TrainingList.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 21.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI
import Resolver

struct TrainingList: View {
    @EnvironmentObject var store: TrainingsStore;
    
    private var trainingsToday: [TrainingListViewModel] {
        get {
            return self.store.trainings.filter { i in i.date.isInThisWeekend()}
        }
    }
    
    private var trainingsLater: [TrainingListViewModel] {
        get {
            return self.store.trainings.filter { i in !i.date.isInThisWeekend()}
        }
    }
    
    var body: some View {
        NavigationView {
            
            List {
                Section {
                    Button(action: {
                        self.store.createNewTraining();
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("new training")
                        }
                    }
                }
            
                Section(header: Text("Finished today")) {
                    
                    if self.trainingsToday.count > 0 {
                        ForEach(self.trainingsToday)  {
                            item in
                            TrainingRow(item: item)
                        }
                    } else {
                        Text("Nothing")
                    }
                }
                
                Section(header: Text("Finished later")) {
                    
                    if self.trainingsLater.count > 0 {
                        ForEach(self.trainingsLater)  {
                            item in
                            TrainingRow(item: item)
                        }
                    } else {
                        Text("Nothing")
                    }
                }
            }
            .navigationBarTitle(Text("Trainings history"))
            .navigationBarItems(
                leading: Button(action: {
                    self.store.reloalTrainingsList(forceReload: true);
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            )
            .listStyle(GroupedListStyle())
        }
    .   navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct TrainingRow: View {
    var item: TrainingListViewModel;
    
    var body: some View {
        NavigationLink(destination: TrainingDetails(trainingId: item.id)) {
            VStack (alignment: .leading) {
                Text("Training at \(item.date.toString())")
                Text("Exercises: \(item.exercisesCount)")
                    .font(.system(size: 10))
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct TrainingList_Previews: PreviewProvider {
    static var previews: some View {
        TrainingList()
    }
}
