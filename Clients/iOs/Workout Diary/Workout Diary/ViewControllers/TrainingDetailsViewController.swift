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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.trainingDetailsViewModel == nil {
            print("TRAINING WITH NOT FOUND. RETURNING TO PREVIOUS SCREEN.")
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationItem.largeTitleDisplayMode = .never;
            self.navigationItem.title = "Training at \(self.trainingDetailsViewModel!.createdDate!.toString())";
        }
    }

    public func setTrainingId(_ trainingId: String?) {
        if let safeId = trainingId {
            self.trainingDetailsViewModel = self.store.getTrainingViewModelBy(id: safeId);
        }
    }
}
