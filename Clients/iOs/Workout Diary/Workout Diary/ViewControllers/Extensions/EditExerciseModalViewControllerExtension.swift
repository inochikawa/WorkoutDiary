//
//  EditExerciseModalViewControllerExtension.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 11.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit

extension EditExerciseViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.exerciseViewModel!.name = textField.text;
    }
    
}
