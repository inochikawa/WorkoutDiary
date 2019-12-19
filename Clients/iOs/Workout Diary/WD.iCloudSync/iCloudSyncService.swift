//
//  iCloudSyncService.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 19.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import CloudKit

class ICloudSyncService {
    private var _containerKey = "iCloud.maxim.stecenko.Workout-Diary";
    private var _container: CKContainer!;
    
    var container: CKContainer {
        if _container == nil {
            _container = CKContainer(identifier: _containerKey);
        }
        
        return _container;
    }
    
    var privateDB: CKDatabase {
        return container.privateCloudDatabase;
    }
    
//    An opaque token that represents the current user’s iCloud identity (read-only)
//    When iCloud is currently available, this property contains an opaque object representing the identity of the current user.
//    If iCloud is unavailable for any reason or there is no logged-in user, the value of this property is nil.
    var isICloudContainerAvailable: Bool {
        return FileManager.default.ubiquityIdentityToken != nil;
    }
    
    
    func trySaveRecords(_ records: [CKRecord]) {
        for r in records {
            trySaveRecord(r);
        }
    }
    
    func tryRemoveRecord(_ recordId: String, successBlock: (() -> Void)?, errorBlock: ((Error) -> Void)?) {
        print("Try to remove record \(recordId)")
        privateDB.delete(withRecordID: CKRecord.ID(recordName: recordId)) { (deletedRecordId, error) in
            if error != nil {
                print("Error while removing record \(recordId): \(error!)");
                if let saveErrorBlock = errorBlock {
                    saveErrorBlock(error!);
                }
            } else {
                print("Removed successfully record \(recordId)");
                if let saveSuccessBlock = successBlock {
                    saveSuccessBlock();
                }
            }
        }
    }
    
    func trySaveRecord(_ record: CKRecord) {
        print("Try to remove record \(record.recordID.recordName)")
        privateDB.delete(withRecordID: record.recordID) { (recordId, error) in
            if error != nil {
                print("Error while removing record \(record.recordID.recordName): \(error!)")
            } else {
                print("Removed successfully record \(record.recordID.recordName)")
            }
            
            print("Try to save record")
            self.privateDB.save(record) { (savedRecord, error) in
                if error != nil {
                    print("Error while saving record \(record.recordID.recordName): \(error!)")
                } else {
                    print("Saved successfully record \(record.recordID.recordName)")
                }
            }
        }
    }
    
    func fetchAllRecords(successBlock: (([TrainingDataObject]) -> Void)?, errorBlock: ((Error?) -> Void)?) {
        let predicate = NSPredicate(value: true);
        let query = CKQuery(recordType: ICloudRecordType.Training.typeName, predicate: predicate);
        let operation = CKQueryOperation(query: query);
        
        var records: [TrainingDataObject] = [];
        
        operation.recordFetchedBlock = { r in
            records.append(TrainingDataObject(from: r));
        }
        
        operation.queryCompletionBlock = { cursor, error in
            if error != nil {
                print("Error while fetching data: \(error!)");
                if let saveErrorBlock = errorBlock {
                    saveErrorBlock(error);
                }
            } else {
                if let saveSuccessBlock = successBlock {
                    saveSuccessBlock(records);
                }
            }
        }
        
        print("Try fetch all data");
        privateDB.add(operation);
    }
}
