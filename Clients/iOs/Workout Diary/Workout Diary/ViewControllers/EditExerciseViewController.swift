//
//  EditExerciseViewController.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 11.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit
import Resolver

protocol EditExerciseModalViewDelegate {
    func onOkClick(exerciseViewModel: ExerciseViewModel) -> Void;
}

class EditExerciseViewController: UIViewController {

    @IBOutlet weak var exerciseNameTextField: UITextField!
    @IBOutlet weak var modalView: UIView!
    
    var delegate: EditExerciseModalViewDelegate?;

    var store: AppStore = Resolver.resolve();
    var exerciseViewModel: ExerciseViewModel?;

    override func viewDidLoad() {
        super.viewDidLoad();

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        self.exerciseNameTextField.delegate = self;
        self.exerciseNameTextField.text = self.exerciseViewModel!.name;
//        self.exerciseNameTextField.becomeFirstResponder();
        
        self.modalView.layer.cornerRadius = 12;
    }

    func prepareViewController(trainingId: String, exerciseId: String?) {
        self.exerciseViewModel = self.store.getExerciseViewModel(trainingId, exerciseId);
    }

    @IBAction func onCancelTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onOkTap(_ sender: UIButton) {
        self.exerciseViewModel!.name = self.exerciseNameTextField.text;

        if let safeDelegate = self.delegate {
            safeDelegate.onOkClick(exerciseViewModel: self.exerciseViewModel!);
        }
        self.dismiss(animated: true, completion: nil)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first;
        
        guard let location = touch?.location(in: self.view) else { return; }
        
        // if user taps outside the modal view
        if !self.modalView.frame.contains(location) {
            self.dismiss(animated: true, completion: nil);
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return true;
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2;
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

}
