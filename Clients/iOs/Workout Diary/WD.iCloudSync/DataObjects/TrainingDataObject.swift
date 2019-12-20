//
//  TrainingDataObject.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 19.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import CloudKit

struct TrainingDataObject: Codable {
    var id: String = "";
    var isInProgress: Bool = false;
    var createdDate: Date = Date();
    var finishedDate: Date = Date();
    var spentTime: Int = 0;
    var name: String = "";
    var exercises: [ExerciseDataObject] = [];
    
    init(from model: TrainingModel) {
        self.id = model.id;
        self.isInProgress = model.isInProgress;
        self.createdDate = model.createdDate;
        self.finishedDate = model.finishedDate;
        self.spentTime = model.spentTime;
        self.name = model.name;
        self.exercises = model.exercises.map({ (exerciseModel) -> ExerciseDataObject in
            return ExerciseDataObject(from: exerciseModel);
        });
    }
    
    init(from ckRecord: CKRecord) {
        self.id = ckRecord[ICloudRecordType.Training.id]!;
        self.isInProgress = ckRecord[ICloudRecordType.Training.isInProgress]!;
        self.createdDate = ckRecord[ICloudRecordType.Training.createdDate]!;
        self.finishedDate = ckRecord[ICloudRecordType.Training.finishedDate]!;
        self.spentTime = ckRecord[ICloudRecordType.Training.spentTime]!;
        self.name = ckRecord[ICloudRecordType.Training.name]!;
        
        let exercisesStrings = ckRecord[ICloudRecordType.Training.exercises] as? [String];
        let jsonDecoder = JSONDecoder();
        
        self.exercises = exercisesStrings == nil
            ? []
            : exercisesStrings!.map {s in
                let data = s.data(using: .utf8)!;
                return try! jsonDecoder.decode(ExerciseDataObject.self, from: data);
        };
    }
    
    var exercisesSerialized: [String] {
        let jsonEncoder = JSONEncoder();
        let jsonData = exercises.map { (e) -> Data in
            return try! jsonEncoder.encode(e);
        }
        
        let strings = jsonData.map { (jsonData) -> String in
            return String(data: jsonData, encoding: .utf8)!;
        }
        
        return strings;
    }
    
    var ckRecord: CKRecord {
        let record = CKRecord(
            recordType: ICloudRecordType.Training.typeName,
            recordID: CKRecord.ID(recordName: self.id)
        );
        
        record[ICloudRecordType.Training.id] = self.id;
        record[ICloudRecordType.Training.name] = self.name;
        record[ICloudRecordType.Training.createdDate] = self.createdDate;
        record[ICloudRecordType.Training.finishedDate] = self.finishedDate;
        record[ICloudRecordType.Training.exercises] = self.exercisesSerialized;
        record[ICloudRecordType.Training.spentTime] = self.spentTime;
        record[ICloudRecordType.Training.isInProgress] = self.isInProgress;
        
        return record;
    }
}
