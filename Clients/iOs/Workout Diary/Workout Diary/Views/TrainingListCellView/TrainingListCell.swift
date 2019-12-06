//
//  TrainingListCell.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 05.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit

class TrainingListCell: UITableViewCell {
    
    @IBOutlet weak var trainingDateLabel: UILabel!
    @IBOutlet weak var completedExercisesLabel: UILabel!
    
    @IBOutlet weak var exerciseWrapperView: UIView!
    @IBOutlet weak var rootView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.exerciseWrapperView.layer.cornerRadius = 4;
        
        self.rootView.layer.cornerRadius = 8;
        self.rootView.layer.cornerRadius = 8;
        self.rootView.layer.masksToBounds = false;
        self.rootView.layer.shadowOffset = CGSize.init(width: 0, height: 0);
        self.rootView.layer.shadowColor = UIColor.black.cgColor;
        self.rootView.layer.shadowOpacity = 0.15;
        self.rootView.layer.shadowRadius = 8;
        
        self.accessoryType = .disclosureIndicator;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.backgroundColor = UIColor(white: 0.95, alpha: 1);
        } else {
            self.backgroundColor = UIColor(white: 1, alpha: 1);
        }
    }
    
    public func setInfo(_ date: Date, _ completedExercise: Int) {
        self.trainingDateLabel.text = date.toString();
        self.completedExercisesLabel.text = String(completedExercise);
    }
    
}
