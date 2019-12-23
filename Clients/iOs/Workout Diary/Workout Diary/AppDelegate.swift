//
//  AppDelegate.swift
//  Workout Diary
//
//  Created by Maxim Stecenko on 04.12.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import UIKit
import Resolver
import Network

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print("didFinishLaunchingWithOptions")

        let monitor: NWPathMonitor = Resolver.resolve();
        monitor.pathUpdateHandler = { path in
            print(path);
        }
        let queue = DispatchQueue.global(qos: .background)
        monitor.start(queue: queue);
        
        
        sd
        fs
        df
        sfsdf
        sdf
        sdf
        sdfsdf
        sdf
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
        print("didDiscardSceneSessions")
        let monitor: NWPathMonitor = Resolver.resolve();
        monitor.cancel();
    }


}

