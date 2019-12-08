//
//  ExerciseCell.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 06.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {

    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var addExerciseLoopButton: UIButton!
    @IBOutlet weak var exerciseLoopCollectionView: UICollectionView!
    
    var exerciseViewModel: ExerciseViewModel?;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.exerciseLoopCollectionView.register(UINib(nibName: ConstantData.Nib.ExerciseLoopCellNibName, bundle: nil), forCellWithReuseIdentifier: ConstantData.Cell.ExerciseLoopCellId);
        
//        self.exerciseLoopCollectionView.register(ExerciseLoopCell.self, forCellWithReuseIdentifier: ConstantData.Cell.ExerciseLoopCellId)
        
        self.exerciseLoopCollectionView.dataSource = self;
        self.exerciseLoopCollectionView.delegate = self;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setViewModel(_ exerciseViewModel: ExerciseViewModel) {
        self.exerciseViewModel = exerciseViewModel;
        
        self.exerciseNameLabel.text = exerciseViewModel.name;
    }
    
    
    
}
