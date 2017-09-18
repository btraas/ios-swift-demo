//
//  Notifications2.swift
//  ios-swift-demo
//
//  Created by Brayden Traas on 2017-09-17.
//  Copyright © 2017 Brayden Traas. All rights reserved.
//

import UserNotifications
import NotificationCenter

class UYLNotificationDelegate: NSObject, UNUserNotificationCenterDelegate
{
    func userNotificationCenter(_: UNUserNotificationCenter,
                                willPresent _: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        // Play sound and show alert to the user
        completionHandler([.alert, .sound])
    }

    func userNotificationCenter(_: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void)
    {
        // Determine the user action
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Default")
        case "Snooze":
            print("Snooze")
        case "Delete":
            print("Delete")
        default:
            print("Unknown action")
        }
        completionHandler()
    }
}
