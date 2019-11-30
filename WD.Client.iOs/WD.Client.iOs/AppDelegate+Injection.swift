//
//  AppDelegate+Injection.swift
//  WD.Client.iOs
//
//  Created by Maxim Stecenko on 30.11.2019.
//  Copyright © 2019 Maxim Stecenko. All rights reserved.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { AppStore() }.scope(application)
        
        // by default scope is Unique
        register { TrainingsStore(with: resolve()) }
    }
}
