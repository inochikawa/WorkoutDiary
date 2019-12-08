//
//  ExerciseLoopCell.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 07.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit

class ExerciseLoopCell: UICollectionViewCell {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var repeatsLabel: UILabel!
    
    var exerciseLoopViewModel: ExerciseLoopViewModel?;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.dividerView.layer.cornerRadius = 0.5; // half of height
        
        if let safeViewModel = self.exerciseLoopViewModel {
            self.weightLabel.text = "\(safeViewModel.weight) kg";
            self.repeatsLabel.text = "\(safeViewModel.repeats)";
        }
    }

    public func setViewModel(_ exerciseLoopViewModel: ExerciseLoopViewModel) {
        self.exerciseLoopViewModel = exerciseLoopViewModel;
    }
}
