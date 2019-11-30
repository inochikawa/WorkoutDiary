//
//  TrainingList.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 21.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI

struct TrainingList: View {
    @EnvironmentObject private var appStore: AppStore;
    @ObservedObject var trainingStore: TrainingsStore = TrainingsStore(with: AppStore());
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.appStore.data)  {
                    item in
                    TrainingRow(item: item)
                }
            }
            .navigationBarTitle(Text("Trainings history"))
            .navigationBarItems(
                leading: Button(action: {
                    self.appStore.reloadData();
                }) {
                    Image(systemName: "arrow.clockwise")
                },
                trailing:
                Button(action: {
                    self.appStore.createNewTraining();
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
    var item: TrainingModel;
    
    var body: some View {
        NavigationLink(destination: TrainingDetails(trainingItem: item)) {
            Text("Training at \(item.createdDate?.toString() ?? "")")
        }
    }
}

struct TrainingList_Previews: PreviewProvider {
    static var previews: some View {
        TrainingList()
    }
}
