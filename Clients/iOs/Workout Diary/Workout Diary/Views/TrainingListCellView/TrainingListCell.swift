//
//  TrainingListCell.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 05.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit
import Resolver

class TrainingListCell: UITableViewCell {
    
    @IBOutlet weak var trainingDateLabel: UILabel!
    @IBOutlet weak var completedExercisesLabel: UILabel!
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var spentTimeLabel: UILabel!
    @IBOutlet weak var stopwatchImage: UIImageView!
    
    var trainingProgressTimer: Timer?;
    
    var trainingListViewModel: TrainingListViewModel!;
    var store: AppStore = Resolver.resolve();
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.rootView.layer.masksToBounds = false;
        self.rootView.layer.shadowOffset = CGSize.init(width: 0, height: 4);
        self.rootView.layer.shadowColor = UIColor(named: "PanelShadowColor")?.cgColor;
        self.rootView.layer.shadowOpacity = 1;
        self.rootView.layer.shadowRadius = 4;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.backgroundColor = UIColor(white: 0.95, alpha: 1);
        } else {
            self.backgroundColor = UIColor(white: 1, alpha: 1);
        }
    }
    
    func setViewMode(_ viewModel: TrainingListViewModel) {
        self.trainingListViewModel = viewModel;
        
        if self.trainingListViewModel.isInProgress {
            // TODO: make refreshing spent time to store
            let timeDiff = Date().timeIntervalSince(self.trainingListViewModel.finishedDate).getSeconds();
            self.trainingListViewModel.spentTime += timeDiff;
        }
        
        self.trainingDateLabel.text = viewModel.date.toUserFriendlyString();
        self.completedExercisesLabel.text = String(viewModel.exercisesCount);
        self.refreshSpentTimeLabel();
        self.setupTimer();
        self.setupStopwatchImage();
    }
    
    func setupTimer() {
        if self.trainingListViewModel.isInProgress {
            self.stopTrainingProgressTimer();
            self.trainingProgressTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {t in
                self.trainingListViewModel.spentTime += 1;

                self.store.updateTrainingSpentTimeAndFinishedDate (
                    trainingId: self.trainingListViewModel.id,
                    spentTime: self.trainingListViewModel.spentTime,
                    finishedDate: Date()
                );

                self.refreshSpentTimeLabel();
            });
        } else {
            self.stopTrainingProgressTimer();
        }
    }
    
    func refreshSpentTimeLabel() {
        self.spentTimeLabel.text = self.trainingListViewModel.spentTime.toTimeString();
    }
    
    func setupStopwatchImage() {
        if self.trainingListViewModel.isInProgress {
            self.stopwatchImage.tintColor = UIColor(named: ConstantData.Color.CancelButton);
        } else {
            self.stopwatchImage.tintColor = UIColor(named: ConstantData.Color.OkButton);
        }
    }
    
    func stopTrainingProgressTimer() {
        self.trainingProgressTimer?.invalidate();
    }
}
