//
//  UIToolbarExtension.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 18.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit

extension UIToolbar {
    
    func ToolbarForPiker(onDoneTap : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default;
        toolBar.isTranslucent = true;
        toolBar.barTintColor = UIColor(named: ConstantData.Color.AppBackground);
        toolBar.tintColor = UIColor(named: ConstantData.Color.OkButton);
        toolBar.sizeToFit();
        
        let doneButton = UIBarButtonItem(title: NSLocalizedString(ConstantData.LocalizeName.UIToolbarDone, comment: ""), style: UIBarButtonItem.Style.done, target: self, action: onDoneTap);
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil);
        
        toolBar.setItems([ spaceButton, doneButton], animated: false);
        toolBar.isUserInteractionEnabled = true;
        
        return toolBar;
    }
    
}
