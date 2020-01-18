//
//  ItemActionContextMenuConfiguration.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 11.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit

func newActionItemContextMenuConfiguration(onEditTap: @escaping () -> Void, onDeleteTap: @escaping () -> Void) -> UIContextMenuConfiguration {
    let config = UIContextMenuConfiguration(
        identifier: nil,
        previewProvider: nil,
        actionProvider: {_ in
            let editAction = UIAction(title: NSLocalizedString(ConstantData.LocalizeName.ItemActionContextEdit, comment: ""), image: UIImage(systemName: "slider.horizontal.3")) { (uiAction) in onEditTap()
            }
            
            let removeAction = UIAction(title: NSLocalizedString(ConstantData.LocalizeName.ItemActionContextRemove, comment: ""), image: UIImage(systemName: "trash"), attributes: [
                UIMenuElement.Attributes.destructive
            ]) { (uiAction) in onDeleteTap();
            }
            
            let menu = UIMenu(title: NSLocalizedString(ConstantData.LocalizeName.ItemActionContextChooseAction, comment: ""), identifier: nil, options: [], children: [editAction, removeAction]);
            
            return menu;
        }
    );
    
    return config;
}
