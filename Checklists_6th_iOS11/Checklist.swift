//
//  Checklist.swift
//  Checklists_6th_iOS11
//
//  Created by Vlado Velkovski on 2/12/18.
//  Copyright © 2018 Vlado Velkovski. All rights reserved.
//

import Foundation

class Checklist: NSObject {
    var name = ""
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
