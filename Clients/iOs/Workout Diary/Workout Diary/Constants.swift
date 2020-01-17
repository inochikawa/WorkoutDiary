//
//  Constants.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 05.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Foundation


struct ConstantData {
    
    struct Cell {
        public static let TrainingListCellId = "TrainingListCell";
        public static let ExerciseCellId = "ExerciseCell";
        public static let ExerciseLoopCellId = "ExerciseLoopCell";
        public static let SettingsCellId = "SettingsCell";
    }
    
    struct Nib {
        public static let TrainingListCellNibName = "TrainingListCell";
        public static let ExerciseCellNibName = "ExerciseCell";
        public static let ExerciseLoopCellNibName = "ExerciseLoopCell";
        public static let SettingsCellNibName = "SettingsCell";
    }
    
    struct Segue {
        public static let ToTrainingDetailsSequeId = "ToTrainingDetailsSeque";
        public static let FromTrainingDetail_ToEditExerciseLoop = "FromTrainingDetail_ToEditExerciseLoop";
        public static let FromTrainingDetail_ToEditExercise = "FromTrainingDetail_ToEditExercise";
        public static let FromTrainingList_ToEditTrainingModal = "FromTrainingList_ToEditTrainingModal";
    }
    
    struct Color {
        public static let OkButton = "OkButtonColor";
        public static let CancelButton = "CancelButtonColor";
        public static let AppText = "AppTextColor";
        public static let AppBackground = "AppBackgroundColor";
        public static let ToolbarForPicker = "ToolbarForPickerColor";
    }
    
    struct LocalizeName {
        public static let Hours = "Hours";
        public static let Minutes = "Minutes";
        public static let Seconds = "Seconds";
        public static let CountOfReps = "CountOfReps";
        public static let AtTime = "AtTime";

        public static let SettingsSyncHeader = "SettingsSyncHeader";
        public static let SettingsUseICloud = "SettingsUseICloud";
        public static let SettingsOnlyThroughWifi = "SettingsOnlyThroughWifi";

        public static let TrainingListTodayHeader = "TrainingListTodayHeader";
        public static let TrainingListYesterdayHeader = "TrainingListYesterdayHeader";
        public static let TrainingListLast7DaysHeader = "TrainingListLast7DaysHeader";
        public static let TrainingListOlderHeader = "TrainingListOlderHeader";
    }
    
}
