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
        var config = Realm.Configuration.defaultConfiguration;
        
        config.schemaVersion = 4;
        config.migrationBlock = { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                // Nothing to do!
                // Realm will automatically detect new properties and removed properties
                // And will update the schema on disk automatically
            }
            if oldSchemaVersion < 2 {
                // set finished date to default value
                migration.enumerateObjects(ofType: TrainingModel.className()) { oldObject, newObject in
                    newObject!["finishedDate"] = Date();
                }
            }
            if oldSchemaVersion < 3 {
                migration.enumerateObjects(ofType: TrainingModel.className()) { oldObject, newObject in
                    newObject!["isInProgress"] = false;
                }
            }
            
            if oldSchemaVersion < 4 {
                migration.enumerateObjects(ofType: TrainingModel.className()) { oldObject, newObject in
                    newObject!["spentTime"] = 0;
                }
            }
        }
        
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("WorkoutDiaryDB.realm")
        
        return config;
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
        do {
            self._realm = try Realm(configuration: self._realmConfig);
        } catch {
            print("Error while initializing DB: \(error)")
        }
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
                self._realm.add(item, update: .all);
            }
        } catch {
            print("Error while adding new item: \(error)")
        }
    }
    
    func updatePropertyInScope(editAction: @escaping () -> Void) {
        do {
            try self._realm.write {
                editAction();
            }
        } catch {
            print("Error while editing item: \(error)")
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
