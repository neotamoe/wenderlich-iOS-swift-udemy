//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by Neota Moe on 9/22/18.
//  Copyright © 2018 Neota Moe. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
  func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
  func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
  func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {

  @IBOutlet weak var newItem: UITextField!
  @IBOutlet weak var cancelBarButton: UIBarButtonItem!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  var itemToEdit: ChecklistItem?
  
  weak var delegate: ItemDetailViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
    newItem.delegate = self
    if let item = itemToEdit {
      title = "Edit Item"
      newItem.text = item.text
      doneBarButton.isEnabled = true
    }
    
  }

//  code version of dismissing first responder status, can also use "sent event" and connect to the done function
//  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//    newItem.resignFirstResponder()
//    return false
//  }
  
  override func viewWillAppear(_ animated: Bool) {
    newItem.becomeFirstResponder()
  }
  
  @IBAction func cancel() {
    navigationController?.popViewController(animated: true)
    delegate?.itemDetailViewControllerDidCancel(self)
  }

  @IBAction func done() {
    if let itemToEdit = itemToEdit {
      itemToEdit.text = newItem.text!
      delegate?.itemDetailViewController(self, didFinishEditing: itemToEdit)
    } else {
      let newItemToAdd = ChecklistItem()
      newItemToAdd.text = newItem.text!
      delegate?.itemDetailViewController(self, didFinishAdding: newItemToAdd)
    }
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let oldText = textField.text!
    let stringRange = Range(range, in:oldText)
    let newText = oldText.replacingCharacters(in: stringRange!, with: string)
    if newText.isEmpty {
      doneBarButton.isEnabled = false
    } else {
      doneBarButton.isEnabled = true
    }
    return true
  }

}
