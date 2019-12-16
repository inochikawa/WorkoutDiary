//
//  ExerciseCell.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 06.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit

protocol ExerciseCellDelegate {
    func onAddExerciseLoop(exerciseId: String) -> Void;
    func onEditExerciseLoop(exerciseId: String, exerciseLoopId: String) -> Void;
    func onRemoveExerciseLoop(exerciseId: String, exerciseLoopId: String) -> Void;
}

class ExerciseCell: UITableViewCell {

    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var noLoopsLabel: UILabel!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var addExerciseLoopButton: UIButton!
    @IBOutlet weak var exerciseLoopCollectionView: UICollectionView!
    
    var exerciseViewModel: ExerciseViewModel?;
    var delegate: ExerciseCellDelegate?;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.exerciseLoopCollectionView.register(UINib(nibName: ConstantData.Nib.ExerciseLoopCellNibName, bundle: nil), forCellWithReuseIdentifier: ConstantData.Cell.ExerciseLoopCellId);
        
        self.exerciseLoopCollectionView.dataSource = self;
        self.exerciseLoopCollectionView.delegate = self;
        self.rootView.layer.cornerRadius = 12;
        self.rootView.layer.shadowColor = UIColor(named: "PanelShadowColor")?.cgColor;
        self.rootView.layer.shadowOpacity = 1;
        self.rootView.layer.shadowRadius = 4;
        self.rootView.layer.shadowOffset = CGSize.init(width: 0, height: 4);
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setViewModel(_ exerciseViewModel: ExerciseViewModel) {
        self.exerciseViewModel = exerciseViewModel;
        
        self.exerciseNameLabel.text = exerciseViewModel.name;
        self.noLoopsLabel.isHidden = self.exerciseViewModel!.loopsCount != 0;
    }
    
    @IBAction func onAddExerciseLoopTap(_ sender: UIButton) {
        if let safeDelegate = self.delegate {
            safeDelegate.onAddExerciseLoop(exerciseId: self.exerciseViewModel!.id);
        }
    }
    
    
}
