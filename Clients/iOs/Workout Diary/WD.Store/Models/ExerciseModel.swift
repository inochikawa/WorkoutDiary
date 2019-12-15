//
//  ExerciseDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;
import RealmSwift;

class ExerciseModel : Object, Identifiable {
    @objc dynamic var id: String;
    @objc dynamic var name: String;
    var loops: List<ExerciseLoopModel>;
    @objc dynamic var trainingId: String?;
    
    required init() {
        self.id = "\(UUID())";
        self.name = "";
        self.loops = List<ExerciseLoopModel>();
    }
    
    init(viewModel: ExerciseViewModel) {
        self.id = viewModel.id;
        self.name = viewModel.name ?? "";
        self.trainingId = viewModel.trainingId;
        
        self.loops = List<ExerciseLoopModel>();
        
        for loopViewModel in viewModel.loops {
            self.loops.append(ExerciseLoopModel(viewModel: loopViewModel))
        }
    }
    
    override class func primaryKey() -> String? {
        return "id";
    }
}
