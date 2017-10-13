//
//  AppDelegate.swift
//  ios-swift-demo
//
//  Created by Brayden Traas on 2017-09-17.
//  Copyright © 2017 Brayden Traas. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import NotificationCenter
import TraceLog
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    let notificationDelegate = UYLNotificationDelegate()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.

        TraceLog.configure(environment: ["LOG_ALL": "TRACE4"])
        logTrace { "enter application didFinishLaunchingWithOptions" }

        let center = UNUserNotificationCenter.current()
        center.delegate = notificationDelegate

        FirebaseApp.configure()

        logTrace { "exit application didFinishLaunchingWithOptions" }

        return true
    }

    func applicationWillResignActive(_: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        logTrace { "enter applicationWillResignActive" }
        logTrace { "exit applicationWillResignActive" }
    }

    func applicationDidEnterBackground(_: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

        logTrace { "enter applicationDidEnterBackground" }
        logTrace { "exit applicationDidEnterBackground" }
    }

    func applicationWillEnterForeground(_: UIApplication)
    {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.

        logTrace { "enter applicationWillEnterForeground" }
        logTrace { "exit applicationWillEnterForeground" }
    }

    func applicationDidBecomeActive(_: UIApplication)
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

        logTrace { "enter applicationDidBecomeActive" }
        logTrace { "exit applicationDidBecomeActive" }
    }

    func applicationWillTerminate(_: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

        logTrace { "enter applicationWillTerminate" }
        logTrace { "exit applicationWillTerminate" }
    }
}
