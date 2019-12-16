//
//  ExerciseLoopCell.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 07.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit

class ExerciseLoopCell: UICollectionViewCell {

    // this label should be displayed when no weight is entered
    @IBOutlet weak var reservedRepeatsLabel: UILabel!
    // this view should be hiden when no weight is entered
    @IBOutlet weak var mainLoopView: UIView!
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var repeatsLabel: UILabel!
    
    var exerciseLoopViewModel: ExerciseLoopViewModel?;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.dividerView.layer.cornerRadius = 0.5; // half of height
        self.rootView.layer.cornerRadius = 10;
        self.layer.cornerRadius = 12;
    }

    public func prepareCell(_ exerciseLoopViewModel: ExerciseLoopViewModel) {
        self.exerciseLoopViewModel = exerciseLoopViewModel;
        
        if exerciseLoopViewModel.weight != 0 {
            self.reservedRepeatsLabel.isHidden = true;
            self.mainLoopView.isHidden = false;
            
            self.weightLabel.text = "\(exerciseLoopViewModel.weight) kg";
            self.repeatsLabel.text = "\(exerciseLoopViewModel.repeats)";
        } else  {
            self.reservedRepeatsLabel.isHidden = false;
            self.mainLoopView.isHidden = true;
            
            self.reservedRepeatsLabel.text = "\(exerciseLoopViewModel.repeats) Reps";
        }
    }
}
