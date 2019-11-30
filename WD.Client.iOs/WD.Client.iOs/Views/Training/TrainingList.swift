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
    @ObservedObject var store: TrainingsStore  = Resolver.resolve();
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.store.trainings)  {
                    item in
                    TrainingRow(item: item)
                }
            }
            .navigationBarTitle(Text("Trainings history"))
            .navigationBarItems(
                leading: Button(action: {
//                    self.appStore.reloadData();
                }) {
                    Image(systemName: "arrow.clockwise")
                },
                trailing:
                Button(action: {
//                    self.appStore.createNewTraining();
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("training")
                    }
                }
            )
        }
        .animation(.spring())
    }
}

struct TrainingRow: View {
    var item: TrainingListViewModel;
    
    var body: some View {
        NavigationLink(destination: TrainingDetails(trainingId: item.id)) {
            Text("Training at \(item.date.toString())")
        }
    }
}

struct TrainingList_Previews: PreviewProvider {
    static var previews: some View {
        TrainingList()
    }
}
