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
        title: NSLocalizedString(ConstantData.LocalizeName.UIAlertSigninICloudTitle, comment: ""),
        message: NSLocalizedString(ConstantData.LocalizeName.UIAlertSigninICloudMessage, comment: ""),
        preferredStyle: .actionSheet
    );
    alert.addAction(UIAlertAction(title: NSLocalizedString(ConstantData.LocalizeName.UIAlertSigninICloudOkActionTitle, comment: ""), style: .cancel, handler: { action in
        syncService.didUserConfirmToEnableICloud = true;
    }))
    
    viewController.present(alert, animated: true);
}
