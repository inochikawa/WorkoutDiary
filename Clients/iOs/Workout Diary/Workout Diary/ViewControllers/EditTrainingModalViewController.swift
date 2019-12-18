//
//  EditTrainingModalViewController.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 18.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit
import Resolver

protocol EditTrainingModalDelegate {
    func onOkClick(viewModel: TrainingListViewModel) -> Void;
}

class EditTrainingModalViewController: UIViewController {
    
    var trainingListViewModel: TrainingListViewModel!;
    var delegate: EditTrainingModalDelegate?;
    var store: AppStore = Resolver.resolve();

    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startedDateTextField: UITextField!
    @IBOutlet weak var spentTimeTextField: UITextField!
    @IBOutlet weak var autofillNameSwitch: UISwitch!
    
    var spentTimePickerView: UIPickerView!;
    var startedDatePickerView: UIDatePicker!;
    
    var spentTimeDataSource: [[Int]] {
        let hours = stride(from: 0, to: 12, by: 1).map {i in return i};
        let minutes = stride(from: 0, to: 60, by: 1).map {i in return i};
        let seconds = stride(from: 0, to: 60, by: 1).map {i in return i};
        
        return [
            hours,
            minutes,
            seconds
        ];
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spentTimePickerView = UIPickerView();
        self.startedDatePickerView = UIDatePicker();
        
        self.autofillNameSwitch.isOn = self.store.autoFillTrainingName;
        self.autofillNameSwitch.addTarget(self, action: #selector(onAutoFillNameSwitchChange), for: .valueChanged)

        self.modalView.layer.cornerRadius = 12;
        
        self.setupSpentTimePickerView();
        self.setupStartedDatePickerView();
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        self.nameTextField.delegate = self;
        
        self.spentTimeTextField.inputView = spentTimePickerView;
        self.spentTimeTextField.inputAccessoryView = UIToolbar().ToolbarForPiker(onDoneTap: #selector(self.onPickerDoneTap));
        self.startedDateTextField.inputView = startedDatePickerView;
        self.startedDateTextField.inputAccessoryView = UIToolbar().ToolbarForPiker(onDoneTap: #selector(self.onPickerDoneTap));
        
        self.prefillFields();
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first;
        
        guard let location = touch?.location(in: self.view) else { return; }
        
        // if user taps outside the modal view
        if !self.modalView.frame.contains(location) {
            self.dismiss(animated: true, completion: nil);
        }
    }
    
    func setViewModel(_ viewModel: TrainingListViewModel) {
        self.trainingListViewModel = viewModel.clone();
    }

    @IBAction func onCancelTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil);
    }

    @IBAction func onOkTap(_ sender: Any) {
        
        self.trainingListViewModel.name = self.nameTextField.text ?? "";
        
        if let saveDelegate = self.delegate {
            saveDelegate.onOkClick(viewModel: self.trainingListViewModel);
        }
        self.dismiss(animated: true, completion: nil);
    }
    
    @objc func onStartedDateChanged(_ sender: UIDatePicker) {
        
        if self.autofillNameSwitch.isOn {
            self.nameTextField.text = sender.date.toUserFriendlyString();
            self.trainingListViewModel.name = sender.date.toUserFriendlyString();
        }
        
        self.startedDateTextField.text = sender.date.toUserFriendlyString();
        self.trainingListViewModel.date = sender.date;
    }
    
    @objc func onPickerDoneTap() {
        self.view.endEditing(true);
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 100;
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func onAutoFillNameSwitchChange(_ sender: UISwitch) {
        self.store.autoFillTrainingName = sender.isOn;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return true;
    }
    
    func setupStartedDatePickerView() {
        self.startedDatePickerView.datePickerMode = .dateAndTime;
        self.startedDatePickerView.maximumDate = Date();
        self.startedDatePickerView.addTarget(self, action: #selector(onStartedDateChanged), for: .valueChanged);
    }
    
    func setupSpentTimePickerView() {
        self.spentTimePickerView.dataSource = self;
        self.spentTimePickerView.delegate = self;
    }
    
    func prefillFields() {
        self.nameTextField.text = self.trainingListViewModel.name;
        self.startedDateTextField.text = self.trainingListViewModel.date.toUserFriendlyString();
        self.spentTimeTextField.text = self.trainingListViewModel.spentTime.toTimeString();
        
        self.prefillSpentTimePickerView();
        self.prefillStartedDatePickerView();
    }
    
    func prefillSpentTimePickerView() {
        let seconds = self.trainingListViewModel.spentTime % 60;
        let minutes = (self.trainingListViewModel.spentTime / 60) % 60;
        let hours = (self.trainingListViewModel.spentTime / 3600);
        
        self.spentTimePickerView.selectRow(self.spentTimeDataSource[0].firstIndex(of: hours)!, inComponent: 0, animated: true);
        self.spentTimePickerView.selectRow(self.spentTimeDataSource[1].firstIndex(of: minutes)!, inComponent: 1, animated: true);
        self.spentTimePickerView.selectRow(self.spentTimeDataSource[2].firstIndex(of: seconds)!, inComponent: 2, animated: true);
    }
    
    func prefillStartedDatePickerView() {
        self.startedDatePickerView.setDate(self.trainingListViewModel.date, animated: true);
    }
}
