//
//  ViewController.swift
//  ios-swift-demo
//
//  Created by Brayden Traas on 2017-09-17.
//  Copyright © 2017 Brayden Traas. All rights reserved.
//

import UIKit
import UserNotifications
import TraceLog

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        logTrace { "enter viewDidLoad" }

        let center = UNUserNotificationCenter.current()

        let options: UNAuthorizationOptions = [.alert, .sound]

        center.requestAuthorization(options: options)
        {
            granted, _ in
            if !granted
            {
                print("Something went wrong")
            }
            else
            {
                let content = UNMutableNotificationContent()
                content.title = "Don't forget"
                content.body = "Buy some milk"
                content.sound = UNNotificationSound.default()

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                                repeats: false)

                content.categoryIdentifier = "UYLReminderCategory"

                let identifier = "UYLLocalNotification"
                let request = UNNotificationRequest(identifier: identifier,
                                                    content: content,
                                                    trigger: trigger)
                center.add(request)
                { error in
                    if let error = error
                    {
                        // Something went wrong
                        print("fail error: " + error.localizedDescription)
                    }
                }
            }
        }

        logTrace { "exit viewDidLoad" }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        logTrace { "enter didReceiveMemoryWarning" }
        logTrace { "exit didReceiveMemoryWarning" }
    }
}
