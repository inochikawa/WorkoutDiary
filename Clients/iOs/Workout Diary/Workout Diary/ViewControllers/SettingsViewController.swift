//
//  SettingsViewController.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 20.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var iCloudSyncSwitch: UISwitch!
    @IBOutlet weak var iCloudSwitchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad();

        setupICloudSyncSwitch();
        self.iCloudSyncSwitch.addTarget(self, action: #selector(onICloudSyncSwitch), for: .valueChanged);
    }
    
    @objc func onICloudSyncSwitch(_ sender: UISwitch) {
        let syncService = ICloudSyncService();
        syncService.isSyncEnabledByUserInTheApp = sender.isOn;
    }
    
    func setupICloudSyncSwitch() {
        iCloudSwitchView.layer.cornerRadius = 12;
        let syncService = ICloudSyncService();
        self.iCloudSyncSwitch.isOn = syncService.isSyncEnabledByUserInTheApp;
    }
}
