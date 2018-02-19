//
//  ChecklistItem.swift
//  Checklists_6th_iOS11
//
//  Created by Vlado Velkovski on 1/16/18.
//  Copyright © 2018 Vlado Velkovski. All rights reserved.
//

import Foundation
import UserNotifications

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    
    var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    
    func toggleChecked() {
        checked = !checked
    }
    
    override init() {
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    deinit {
        removeNotification()
    }
    
    func scheduleNotification() {
        removeNotification()
        if shouldRemind && dueDate > Date() {

            let content = UNMutableNotificationContent()
            content.title = "Reminder"
            content.body = text
            content.sound = UNNotificationSound.default()
            
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.month, .day,. hour, .minute], from: dueDate)
        
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled: \(request) for itemID: \(itemID)")
        }
    }
    
    func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removeDeliveredNotifications(withIdentifiers: ["\(itemID)"])
    }
}
