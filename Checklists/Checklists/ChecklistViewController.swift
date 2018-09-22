//
//  ViewController.swift
//  Checklists
//
//  Created by Neota Moe on 9/22/18.
//  Copyright © 2018 Neota Moe. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      if cell.accessoryType == .none {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
      tableView.deselectRow(at: indexPath, animated: true)
    }
    
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    let label = cell.viewWithTag(1000) as! UILabel
    
    if indexPath.row % 5 == 0 {
      label.text = "walk the dog"
    } else if indexPath.row % 5 == 1 {
      label.text = "brush my teeth"
    } else if indexPath.row % 5 == 2 {
      label.text = "learn iOS development"
    } else if indexPath.row % 5 == 3 {
      label.text = "soccer practice"
    } else {
      label.text = "eat ice cream"
    }
    return cell
  }
  


}

