//
//  TrainingDetailsViewController.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 05.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit
import Resolver

class TrainingDetailsViewController: UIViewController {
    
    var store: AppStore = Resolver.resolve();
    var trainingDetailsViewModel: TrainingDetailsViewModel?;
    
    var selectedExerciseId: String!;
    var selectedExerciseLoopId: String?;

    @IBOutlet weak var completedExercisesLabel: UILabel!
    @IBOutlet weak var exerciseListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exerciseListView.dataSource = self;
        self.exerciseListView.delegate = self;
        self.exerciseListView.register(UINib(nibName: ConstantData.Nib.ExerciseCellNibName, bundle: nil), forCellReuseIdentifier: ConstantData.Cell.ExerciseCellId);
        
        self.exerciseListView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0);
        
        if self.trainingDetailsViewModel == nil {
            print("TRAINING NOT FOUND. RETURNING TO PREVIOUS SCREEN.")
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationItem.largeTitleDisplayMode = .never;
            self.navigationItem.title = "\(self.trainingDetailsViewModel!.createdDate!.toString())";
            self.refreshCompletedExercisesCountLabel();
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        print("View did appear")
    }

    @IBAction func onAddExerciseTap(_ sender: UIButton) {
        self.selectedExerciseLoopId = nil;
        self.selectedExerciseId = nil;
        self.navigateToEditExerciseModal();
    }

    func setTrainingId(_ trainingId: String?) {
        if let safeId = trainingId {
            self.trainingDetailsViewModel = self.store.getTrainingViewModelBy(id: safeId);
        }
    }
    
    func refreshCompletedExercisesCountLabel() {
        self.completedExercisesLabel.text = "\(self.trainingDetailsViewModel!.exercisesCount)";
    }
    
    func navigateToEditExerciseModal() {
        self.performSegue(withIdentifier: ConstantData.Segue.FromTrainingDetail_ToEditExercise, sender: self);
    }
    
    func navigateToEditExerciseLoopModal() {
        self.performSegue(withIdentifier: ConstantData.Segue.FromTrainingDetail_ToEditExerciseLoop, sender: self);
    }
}
