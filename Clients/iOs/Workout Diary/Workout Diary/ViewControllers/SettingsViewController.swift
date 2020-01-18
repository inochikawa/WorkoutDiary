//
//  SettingsViewController.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 20.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit
import Resolver

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsListView: UITableView!
    
    var appSettings: AppSettings = Resolver.resolve();
    
    var settingSections: [SettingSection] {
        let syncSection = SettingSection(header: NSLocalizedString(ConstantData.LocalizeName.SettingsSyncHeader, comment: ""), settings: [
            SettingItemViewModel(
                title: NSLocalizedString(ConstantData.LocalizeName.SettingsUseICloud, comment: ""),
                key: AppSettings.Key.iCloudSync,
                isOn: appSettings.enableICloudSync,
                onSettingChange: { newValue in self.appSettings.enableICloudSync = newValue }
            )
        ])
        
        if self.appSettings.enableICloudSync {
            syncSection.settings.append(
                SettingItemViewModel(
                    title: NSLocalizedString(ConstantData.LocalizeName.SettingsOnlyThroughWifi, comment: ""),
                    key: AppSettings.Key.wifiSync,
                    isOn: appSettings.syncOnlyViaWiFi,
                    onSettingChange: { newValue in self.appSettings.syncOnlyViaWiFi = newValue }
                )
            );
        }
        
        return [syncSection];
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        settingsListView.delegate = self;
        settingsListView.dataSource = self;
        
        self.settingsListView.register(UINib(nibName: ConstantData.Nib.SettingsCellNibName, bundle: nil), forCellReuseIdentifier: ConstantData.Cell.SettingsCellId);
    }
}
