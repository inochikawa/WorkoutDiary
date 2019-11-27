//
//  TrainingList.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 21.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import SwiftUI

struct TrainingList: View {
    @ObservedObject private var trainingsStore: TrainingsStore = TrainingsStore();
    
    var body: some View {
        NavigationView {
            List {
//                ForEach(testData)  {
                ForEach(self.trainingsStore.trainings)  {
                    item in
                    TrainingRow(item: item)
                }
            }
            .navigationBarTitle(Text("Trainings history"))
            .navigationBarItems(
                leading: Button(action: {
                    self.trainingsStore.reloadData();
                }) {
                    Image(systemName: "goforward")
                },
                trailing:
                Button(action: {
                    
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
    var item: TrainingDto;
    
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
