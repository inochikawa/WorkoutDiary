//
//  ExerciseLoopDto.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation;
import RealmSwift;

class ExerciseLoopModel : Object, Identifiable {
    @objc dynamic var id: String;
    @objc dynamic var repeats: Int;
    @objc dynamic var weight: Double;
    @objc dynamic var exerciseId: String!;
    
    required init() {
        self.id = "\(UUID())";
        self.repeats = 0;
        self.weight = 0;
    }
    
    init(viewModel: ExerciseLoopViewModel) {
        self.id = viewModel.id;
        self.repeats = viewModel.repeats;
        self.weight = viewModel.weight;
        self.exerciseId = viewModel.exerciseId;
    }
    
    override class func primaryKey() -> String? {
        return "id";
    }
}
