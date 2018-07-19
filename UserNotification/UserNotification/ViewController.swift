//
//  ViewController.swift
//  UserNotification
//
//  Created by Amee Thakkar on 7/4/18.
//  Copyright © 2018 Amee Thakkar. All rights reserved.
//

import UIKit
import UserNotifications
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        richMediaNotification()
    }

    func basicNotification() {
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Basic Notification"
        content.subtitle = "Subtitle"
        content.body = "This is the body of basic notification"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Basic", content: content, trigger: trigger)
        
        center.add(request)
    }

    func calenderBasedNotification() {
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Calender Notification"
        content.subtitle = "Subtitle"
        content.body = "This is calender notification"
        
        var dateComponent = DateComponents()
        dateComponent.hour = 17
        dateComponent.minute = 47
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Calender", content: content, trigger: trigger)
        
        center.add(request)
    }
    
    func customSound() {
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Sound Notification"
        content.subtitle = "Subtitle"
        content.body = "This is the body of custom sound notification"
//        content.sound = UNNotificationSound.default()
        content.sound = UNNotificationSound(named: "alert.mp3")
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Basic", content: content, trigger: trigger)
        
        center.add(request)
    }
    
    func richMediaNotification() {
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Rich Media Notification"
        content.subtitle = "Subtitle"
        content.body = "This is the body of rich media notification"
        
        let url = Bundle.main.url(forResource: "Deer", withExtension: "mp4")
        
        if let url = url {
            let video = try? UNNotificationAttachment(identifier: "video", url: url, options : nil)
            
            if let video = video {
                content.attachments = [video]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Basic", content: content, trigger: trigger)
        
        center.add(request)
    }
    
    func locationBasedNotification()
    {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Location Based Notification"
        content.subtitle = "Subtitle"
        content.body = "This is the body of location based notification"
        
        let centerCoordinate = CLLocationCoordinate2DMake(38.9736, -100.8765)
        let region = CLCircularRegion(center: centerCoordinate, radius: 50, identifier: "home")
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: "location", content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        
    }

    func getList()
    {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "Subtitle"
        content.body = "This is the body of the notification"
        
        let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 11, repeats: false)
        let trigger3 = UNTimeIntervalNotificationTrigger(timeInterval: 12, repeats: false)
        let trigger4 = UNTimeIntervalNotificationTrigger(timeInterval: 13, repeats: false)
        let trigger5 = UNTimeIntervalNotificationTrigger(timeInterval: 14, repeats: false)
        
        let request1 = UNNotificationRequest(identifier: "basic1", content: content, trigger: trigger1)
        let request2 = UNNotificationRequest(identifier: "basic2", content: content, trigger: trigger2)
        let request3 = UNNotificationRequest(identifier: "basic3", content: content, trigger: trigger3)
        let request4 = UNNotificationRequest(identifier: "basic4", content: content, trigger: trigger4)
        let request5 = UNNotificationRequest(identifier: "basic5", content: content, trigger: trigger5)
        
        center.add(request1)
        center.add(request2)
        center.add(request3)
        center.add(request4)
        center.add(request5)
        
        center.getPendingNotificationRequests { (allNotifications) in
            
            for notification in allNotifications
            {
                print(notification.identifier)
            }
        }
        
    }
    
    func removeFromNC()
    {
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
    }

}

