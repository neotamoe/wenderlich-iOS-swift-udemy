//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Neota Moe on 9/22/18.
//  Copyright © 2018 Neota Moe. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {

  @IBOutlet weak var newItem: UITextField!
  @IBOutlet weak var cancelBarButton: UIBarButtonItem!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
    newItem.delegate = self
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
  }

  @IBAction func done() {
    navigationController?.popViewController(animated: true)
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
