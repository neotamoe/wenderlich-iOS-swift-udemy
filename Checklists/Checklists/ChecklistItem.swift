//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Neota Moe on 9/22/18.
//  Copyright © 2018 Neota Moe. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
  var text = ""
  var checked = false
  
  func toggleChecked() {
    checked = !checked
  }
}
