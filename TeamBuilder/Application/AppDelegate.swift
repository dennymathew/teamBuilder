//
//  AppDelegate.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 9/13/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        PersistenceService.saveContext()
    }
}
