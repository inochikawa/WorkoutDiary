//
//  EditExerciseLoopModalViewControllerExtension.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 10.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit

extension EditExerciseLoopModalViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case self.weightPickerTag:
            self.exerciseLoopViewModel!.weight = self.weightPickerRange[row];
            break;
        case self.repeatsPickerTag:
            self.exerciseLoopViewModel!.repeats = self.repeatsPickerRange[row];
            break;
        default:
            // ignore
            break;
        }
    }
}

extension EditExerciseLoopModalViewController : UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case self.weightPickerTag:
            return self.weightPickerRange.count;
        case self.repeatsPickerTag:
            return self.repeatsPickerRange.count;
        default:
            return 0;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case self.weightPickerTag:
            // check if weightSelectorStep is Int
            let showDecimalPoint = floor(self.selectedWeightStep) == self.selectedWeightStep;
            return showDecimalPoint ? String(format:"%.0f", self.weightPickerRange[row]) : String(format:"%.1f", self.weightPickerRange[row]);
        case self.repeatsPickerTag:
            return "\(self.repeatsPickerRange[row])";
        default:
            return nil;
        }
    }
}

