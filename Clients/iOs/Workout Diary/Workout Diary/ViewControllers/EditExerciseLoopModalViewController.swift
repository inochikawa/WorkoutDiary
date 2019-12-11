//
//  EditExerciseLoopModalViewController.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 10.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit
import Resolver;

protocol EditExerciseLoopModalDelegate {
    func onOkModalTap(exerciseLoopViewModel: ExerciseLoopViewModel) -> Void;
}

class EditExerciseLoopModalViewController: UIViewController {

    var delegate: EditExerciseLoopModalDelegate?;
    
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var weightPicker: UIPickerView!
    @IBOutlet weak var repeatsPicker: UIPickerView!
    @IBOutlet weak var weightStepControl: UISegmentedControl!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    
    let weightPickerTag = 100;
    let repeatsPickerTag = 200;
    
    var weightPickerRange: [Double] {
        return stride(from: 0, to: 300, by: self.selectedWeightStep).map {i in return i};
    }
    
    var repeatsPickerRange: [Int] {
        return stride(from: 0, to: 300, by: 1).map {i in return i};
    }
    
    let weightStepRange: [Double] = [1, 2.5, 5, 10];
    var selectedWeightStep: Double = 1;
    
    var selectedWeightPickedIndex = 0;
    var selectedRepeatsPickedIndex = 0;
    
    var exerciseLoopViewModel: ExerciseLoopViewModel?;
    var store: AppStore = Resolver.resolve();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exerciseNameLabel.text = self.exerciseLoopViewModel!.exerciseName;
        
        self.setupPickers();
        self.modalView.layer.cornerRadius = 12;
        
        self.selectedWeightStep = self.weightStepRange[0];
    }
    
    func prepareExerciseLoopViewModel(trainingId: String, exerciseId: String, exerciseLoopId: String?) {
        self.exerciseLoopViewModel = self.store.getExerciseLoopViewModel(trainingId, exerciseId, exerciseLoopId);
        
        if let weightIndex = self.weightPickerRange.firstIndex(of: self.exerciseLoopViewModel!.weight) {
            self.selectedWeightPickedIndex = weightIndex;
        }
        
        if let repeatsIndex = self.repeatsPickerRange.firstIndex(of: self.exerciseLoopViewModel!.repeats) {
            self.selectedRepeatsPickedIndex = repeatsIndex;
        }
    }

    @IBAction func onWeightStepChanged(_ sender: UISegmentedControl) {
        self.selectedWeightStep = self.weightStepRange[sender.selectedSegmentIndex];
        self.weightPicker.reloadComponent(0);
    }
    
    @IBAction func onCancelTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func onOkTap(_ sender: Any) {
        if let safeDelegate = self.delegate {
            safeDelegate.onOkModalTap(exerciseLoopViewModel: self.exerciseLoopViewModel!);
        }
        self.dismiss(animated: true, completion: nil);
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first;
        
        guard let location = touch?.location(in: self.view) else { return; }
        
        // if user taps outside the modal view
        if !self.modalView.frame.contains(location) {
            self.dismiss(animated: true, completion: nil);
        }
    }
    
    private func setupPickers() {
        self.weightPicker.tag = self.weightPickerTag;
        self.repeatsPicker.tag = self.repeatsPickerTag;
        
        self.weightPicker.dataSource = self;
        self.weightPicker.delegate = self;
        
        self.repeatsPicker.dataSource = self;
        self.repeatsPicker.delegate = self;
        
        self.weightPicker.selectRow(self.selectedWeightPickedIndex, inComponent: 0, animated: true);
        self.repeatsPicker.selectRow(self.selectedRepeatsPickedIndex, inComponent: 0, animated: true);
    }
    
    
}
