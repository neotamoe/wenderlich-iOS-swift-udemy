//
//  ViewController.swift
//  Checklists
//
//  Created by Neota Moe on 9/22/18.
//  Copyright © 2018 Neota Moe. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {

  var items: [ChecklistItem]
  
  required init?(coder aDecoder: NSCoder) {
    items = [ChecklistItem]()
    
    let row0Item = ChecklistItem()
    row0Item.text = "walk the dog"
    items.append(row0Item)

    let row1Item = ChecklistItem()
    row1Item.text = "brush teeth"
    items.append(row1Item)
    
    let row2Item = ChecklistItem()
    row2Item.text = "learn iOS development"
    items.append(row2Item)
    
    let row3Item = ChecklistItem()
    row3Item.text = "soccer practice"
    items.append(row3Item)
    
    let row4Item = ChecklistItem()
    row4Item.text = "eat ice cream"
    items.append(row4Item)
    
    let row5Item = ChecklistItem()
    row5Item.text = "walk the cat"
    items.append(row5Item)
    
    let row6Item = ChecklistItem()
    row6Item.text = "shower"
    items.append(row6Item)
    
    let row7Item = ChecklistItem()
    row7Item.text = "submit timesheet"
    items.append(row7Item)
    
    let row8Item = ChecklistItem()
    row8Item.text = "soccer game"
    items.append(row8Item)
    
    let row9Item = ChecklistItem()
    row9Item.text = "put gas in car"
    items.append(row9Item)

    super.init(coder: aDecoder)

  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      items.remove(at: indexPath.row)
//      let indexPaths = [indexPath]
//      tableView.deleteRows(at: indexPaths, with: .automatic)
      tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      let item = items[indexPath.row]
      item.toggleChecked()
      
      configureCheckmark(for: cell, with: item)
    }
    tableView.deselectRow(at: indexPath, animated: true)

  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    let item = items[indexPath.row]
    
    configureText(for: cell, with: item)
    configureCheckmark(for: cell, with: item)
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "addItem" {
      let controller = segue.destination as! AddItemViewController
      controller.delegate = self
    }
  }
  
  func configureText(for cell: UITableViewCell, with item: ChecklistItem){
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = item.text
  }
  
  func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
    
    let label = cell.viewWithTag(1001) as! UILabel
    
    if item.checked {
      label.text = "√"
    } else {
      label.text = ""
    }
  }

  @IBAction func addItem(_ sender: UIBarButtonItem) {
    
    var titles = ["i'm a new teapot", "find a new gig", "apply to jobs", "make your commit to github"]
    let randomNumber = arc4random_uniform(UInt32(titles.count))
    let title = titles[Int(randomNumber)]
    
    let newRowIndex = items.count
    let item = ChecklistItem()
    item.text = title
    
    items.append(item)
    
    let indexPath = IndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths, with: .automatic)
    
  }
  
  func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
    navigationController?.popViewController(animated: true)
  }
  
  func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
    let newRowIndex = items.count
    items.append(item)
    let indexPath = IndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths, with: .automatic)
    navigationController?.popViewController(animated: true)
  }
  
  
}

