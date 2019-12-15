//
//  TrainingsManager.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 19.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import RealmSwift
import Resolver

// TODO: should be registered as Unique
class DataSource {
    private var _realmConfig: Realm.Configuration {
        return Realm.Configuration(
            fileURL: Bundle.main.url(forResource: "WorkoutDiaryDB", withExtension: "realm"),
            readOnly: false
        );
    }
    
    private var _realm: Realm!;
    
    var trainings: Results<TrainingModel> {
        return self._realm.objects(TrainingModel.self);
    };
    
    var exercises: Results<ExerciseModel> {
        return self._realm.objects(ExerciseModel.self);
    };
    
    var exerciseLoops: Results<ExerciseLoopModel> {
        return self._realm.objects(ExerciseLoopModel.self);
    };
    
    init() {
        self._realm = try! Realm(configuration: self._realmConfig);
    }
    
    public func getTrainingBy(id: String) -> TrainingModel? {
        return self.trainings.filter { i in return i.id == id }.first;
    }
    
    public func getExerciseBy(id: String) -> ExerciseModel? {
        return self.exercises.filter { i in return i.id == id }.first;
    }
    
    public func getExerciseLoopBy(id: String) -> ExerciseLoopModel? {
        return self.exerciseLoops.filter { i in return i.id == id }.first;
    }
    
    func addItem<TItem: Object>(item: TItem) {
        do {
            try self._realm.write {
                self._realm.add(item);
            }
        } catch {
            print("Error while adding new item: \(error)")
        }
    }
    
    func removeItem<TItem: Object>(item: TItem) {
        do {
            try self._realm.write {
                self._realm.delete(item);
            }
        } catch {
            print("Error while removing new item: \(error)")
        }
    }

    func saveChanges() {
        do {
            try self._realm.commitWrite();
        } catch {
            print("Error while updating data: \(error)")
        }
    }
    
    static func newInstanse() -> DataSource {
        return Resolver.resolve() as DataSource;
    }
}
