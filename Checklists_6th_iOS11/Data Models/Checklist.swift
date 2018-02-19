//
//  Checklist.swift
//  Checklists_6th_iOS11
//
//  Created by Vlado Velkovski on 2/12/18.
//  Copyright © 2018 Vlado Velkovski. All rights reserved.
//

import Foundation

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    var iconName = "No Icon"
    
    
    var countUncheckedItems: Int {
        get {
            //return items.filter{ !$0.checked }.count
            return items.reduce(0) {cnt, item in cnt + (item.checked ? 0 : 1) }
        }
    }
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
}
