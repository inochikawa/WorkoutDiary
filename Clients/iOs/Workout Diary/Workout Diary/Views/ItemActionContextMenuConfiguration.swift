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
            let editAction = UIAction(title: "Edit", image: UIImage(systemName: "slider.horizontal.3")) { (uiAction) in onEditTap()
            }
            
            let removeAction = UIAction(title: "Remove", image: UIImage(systemName: "trash"), attributes: [
                UIMenuElement.Attributes.destructive
            ]) { (uiAction) in onDeleteTap();
            }
            
            let menu = UIMenu(title: "Choose action", identifier: nil, options: [], children: [editAction, removeAction]);
            
            return menu;
        }
    );
    
    return config;
}
