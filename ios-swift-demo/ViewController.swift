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
import Firebase

class ViewController: UIViewController
{
    @IBAction func dateChanged(_ sender: UIDatePicker)
    {
        setDays.text = String(Int(round(Float(sender.date.timeIntervalSinceNow.description)! / 60 / 60 / 24)))
    }

    @IBOutlet var setDays: UITextView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        logTrace { "enter viewDidLoad" }

        // lab 1

        title = "Main"

        logTrace { "exit viewDidLoad" }
    }

    @IBAction func sendClick(_: UIButton)
    {
        showNotification()
    }

    @IBOutlet var titleField2: UITextField!

    @IBOutlet var message: UITextField!

    func showNotification()
    {
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
                content.title = self.titleField2.text!
                content.body = self.message.text!
                content.sound = UNNotificationSound.default()

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1,
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

                // Chapter 8: Notification center

                // Note: The last parameter ("using:" callback) in addObserver is passed in as a block of code, see below
                //
                let messageName = "DarcyTest"

                let observer = Notifications.addObserver(messageName: messageName, object: nil)
                { _ in
                    logTrace { "Received the notification" }
                }

                // Post the Notification (callback should run)
                Notifications.post(messageName: messageName, object: nil, userInfo: nil)

                // Remove the observer
                Notifications.removeObserver(observer: observer)

                // Test posting after removing the observer (callback should not run)
                Notifications.post(messageName: messageName, object: nil, userInfo: nil)
            }
        }
    }

    override func viewDidAppear(_: Bool)
    {
        Analytics.logEvent(AnalyticsEventSelectContent,
                           parameters:
                               [
                                   AnalyticsParameterItemID: "id-\(title!)" as NSObject,
                                   AnalyticsParameterItemName: title! as NSObject,
                                   AnalyticsParameterContentType: "cont" as NSObject,
        ])
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        logTrace { "enter didReceiveMemoryWarning" }
        logTrace { "exit didReceiveMemoryWarning" }
    }
}
