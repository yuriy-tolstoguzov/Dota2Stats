//
//  AppDelegate.swift
//  Dota2Stats
//
//  Created by Yuriy Tolstoguzov on 4/25/17.
//  Copyright © 2017 Yuriy Tolstoguzov. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    fileprivate let serviceProvider: ServiceProviderType = ServiceProvider()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let controller = (window?.rootViewController as! UINavigationController).viewControllers.first! as! MatchesViewController
        controller.reactor = MatchesReactor(provider: serviceProvider)

        return true
    }

}

