//
//  ICloudAlertCreator.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 22.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit
import Resolver

func presentICloudAlert(from viewController: UIViewController) {
    let syncService: ICloudSyncService = Resolver.resolve();
    let alert = UIAlertController(
        title: "Sign in to iCloud",
        message: "Sign in to your iCloud account to write records.\n\nOn the Home screen, launch Settings, tap iCloud, and enter your Apple ID. Turn iCloud Drive on. If you don't have an iCloud account, tap Create a new Apple ID.",
        preferredStyle: .actionSheet
    );
    alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { action in
        syncService.didUserConfirmToEnableICloud = true;
    }))
    
    viewController.present(alert, animated: true);
}
