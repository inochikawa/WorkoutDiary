//
//  SettingsViewControllerExtension.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 21.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit
import Resolver

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingSections.count;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingSections[section].header;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingSections[section].settings.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantData.Cell.SettingsCellId, for: indexPath) as! SettingsCell;
        cell.delegate = self;
        cell.indexPath = indexPath;
        cell.label.text = settingSections[indexPath.section].settings[indexPath.row].title;
        cell.toggle.isOn = settingSections[indexPath.section].settings[indexPath.row].isOn;
        return cell;
    }
}

extension SettingsViewController: UITableViewDelegate {
    
}

extension SettingsViewController: SettingsCellDelegate {
    func onSettingValueChange(isOn: Bool, at indexPath: IndexPath) {
        settingSections[indexPath.section].settings[indexPath.row].onSettingChange(isOn);
        
        settingsListView.reloadData();
        
        let setting = settingSections[indexPath.section].settings[indexPath.row];
        
        if setting.key == .iCloudSync && setting.isOn {
            // in this index path is "Sync via WiFi"
            settingsListView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .middle);
            
            let syncService: ICloudSyncService = Resolver.resolve();

            syncService.checkIfICloudContainerAvailable { (isOk) in
                if !syncService.didUserConfirmToEnableICloud && !isOk {
                    DispatchQueue.main.async {
                        presentICloudAlert(from: self);
                    }
                }
            }
        }

    }
}
