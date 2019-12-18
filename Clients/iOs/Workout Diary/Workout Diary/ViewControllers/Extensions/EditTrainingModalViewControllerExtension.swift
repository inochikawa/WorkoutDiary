//
//  EditTrainingModalViewControllerExtension.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 18.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation
import UIKit

extension EditTrainingModalViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return self.spentTimeDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.spentTimeDataSource[component].count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%.2d", self.spentTimeDataSource[component][row]);
    }
    
}

extension EditTrainingModalViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let hours = pickerView.selectedRow(inComponent: 0);
        let minutes = pickerView.selectedRow(inComponent: 1);
        let seconds = pickerView.selectedRow(inComponent: 2);
        
        self.spentTimeTextField.text = String(format: "%.1dh %.2dm %.2ds", hours, minutes, seconds);
        self.trainingListViewModel.spentTime = hours * 3600 + minutes * 60 + seconds;
    }
}

extension EditTrainingModalViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.trainingListViewModel.name = textField.text ?? "";
    }
}
