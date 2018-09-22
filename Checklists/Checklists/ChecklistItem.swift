//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Neota Moe on 9/22/18.
//  Copyright © 2018 Neota Moe. All rights reserved.
//

import Foundation

class ChecklistItem {
  var text = ""
  var checked = true
  
  func toggleChecked() {
    checked = !checked
  }
}
