//
//  SettingsCell.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 21.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit

protocol SettingsCellDelegate {
    func onSettingValueChange(isOn: Bool, at indexPath: IndexPath);
}

class SettingsCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggle: UISwitch!
    
    var delegate: SettingsCellDelegate?;
    var indexPath: IndexPath!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.toggle.addTarget(self, action: #selector(onSettingToggle), for: .valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func onSettingToggle(_ sender: UISwitch) {
        if delegate != nil {
            delegate!.onSettingValueChange(isOn: sender.isOn, at: indexPath);
        }
    }
    
}
