//
//  ChecklistItem.swift
//  Checklists_6th_iOS11
//
//  Created by Vlado Velkovski on 1/16/18.
//  Copyright © 2018 Vlado Velkovski. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
