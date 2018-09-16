//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Neota Moe on 9/14/18.
//  Copyright © 2018 Neota Moe. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

  @IBOutlet weak var webView: WKWebView!
  
  @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
        if let htmlData = try? Data(contentsOf: url) {
          let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
          webView.load(htmlData, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: baseURL)
        }
      }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
  


}
