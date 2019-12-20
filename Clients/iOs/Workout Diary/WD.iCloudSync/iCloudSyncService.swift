//
//  iCloudSyncService.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 19.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

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
    
    @UserDefault<Bool>("didUserConfirmToEnableICloud", defaultValue: false)
    var didUserConfirmToEnableICloud: Bool;
    
    @UserDefault<Bool>("isSyncEnabledByUserInTheApp", defaultValue: true)
    var isSyncEnabledByUserInTheApp: Bool;
    
    func checkIfICloudContainerAvailable(completionBlock: @escaping (Bool) -> Void) {
        print("Try get account status");
        showNetworkIndicator();
        container.accountStatus { status, error in
            if let error = error {
              // some error occurred (probably a failed connection, try again)
              print("Error while fetching account status: \(error)")
            } else {
                switch status {
                case .available:
                    print("The user is logged in");
                    break
                case .noAccount:
                    print("The user is NOT logged in");
                    break;
                case .couldNotDetermine:
                    print("For some reason, the status could not be determined (try again)");
                    break;
                case .restricted:
                    print("iCloud settings are restricted by parental controls or a configuration profile");
                    break;
                @unknown default:
                    print("Unkown status");
                    break;
                }
                
                if !self.isSyncEnabledByUserInTheApp {
                    print("Sync disabled in the app by User");
                }
                
                completionBlock(status == .available && self.isSyncEnabledByUserInTheApp);
            }
            self.hideNetworkIndicator();
        }
    }
    
    func trySaveRecords(_ records: [CKRecord], completionBlock: ((Bool) -> Void)?) {
        var completedResults: [Bool] = [];
        
        if records.count == 0 {
            if completionBlock != nil {
                completionBlock!(true);
            }
            return;
        }
        
        for r in records {
            trySaveRecord(r, completionBlock: { isOk in
                completedResults.append(isOk);
                
                if completedResults.count == records.count && completionBlock != nil {
                    completionBlock!(completedResults.allSatisfy({ (i) -> Bool in
                        return i == true;
                    }));
                }
            });
        }
    }
    
    func tryRemoveRecord(_ recordId: String, successBlock: (() -> Void)?, errorBlock: ((Error) -> Void)?) {
        print("Try to remove record \(recordId)")
        showNetworkIndicator();
        privateDB.delete(withRecordID: CKRecord.ID(recordName: recordId)) { (deletedRecordId, error) in
            self.hideNetworkIndicator();
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
    
    func trySaveRecord(_ record: CKRecord, completionBlock: ((Bool) -> Void)?) {
        print("Try to remove record \(record.recordID.recordName)")
        showNetworkIndicator();
        privateDB.delete(withRecordID: record.recordID) { (recordId, error) in
            if error != nil {
                print("Error while removing record \(record.recordID.recordName): \(error!)")
            } else {
                print("Removed successfully record \(record.recordID.recordName)")
            }
            
            print("Try to save record")
            self.privateDB.save(record) { (savedRecord, error) in
                self.hideNetworkIndicator();
                if error != nil {
                    print("Error while saving record \(record.recordID.recordName): \(error!)")
                } else {
                    print("Saved successfully record \(record.recordID.recordName)")
                }
                
                if completionBlock != nil {
                    completionBlock!(error == nil);
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
            self.hideNetworkIndicator();
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
        
        showNetworkIndicator();
        print("Try fetch all data");
        privateDB.add(operation);
    }
    
    private func showNetworkIndicator() {
        // for now ignore.
//        DispatchQueue.main.async {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true;
//        }
    }
    
    private func hideNetworkIndicator() {
        // for now ignore.
//        DispatchQueue.main.async {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false;
//        }
    }
}
