//
//  ViewController.swift
//  BullsEye
//
//  Created by Neota Moe on 9/13/18.
//  Copyright © 2018 Neota Moe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var currentValue = 0
  @IBOutlet weak var slider: UISlider!
  
  var targetValue = 0
  @IBOutlet weak var targetValueLabel: UILabel!
  
  var score = 0
  @IBOutlet weak var scoreLabel: UILabel!
  
  var round = 0
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    currentValue = lroundf(slider.value)
    startOverButtonPressed()
    
    let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") // UIImage(named: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, for: .normal)
    
    let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted") // UIImage(named: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)

    let trackImageLeft = #imageLiteral(resourceName: "SliderTrackLeft") // UIImage(named: "SliderTrackLeft")
    let trackLeftResizable = trackImageLeft.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
    
    let trackImageRight = #imageLiteral(resourceName: "SliderTrackRight") // UIImage(named: "SliderTrackRight")
    let trackRightResizable = trackImageRight.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)
  }
  
  func updateLabels() {
    targetValueLabel.text = "\(targetValue)"
    scoreLabel.text = "\(score)"
    roundLabel.text = "\(round)"
  }

  func startNewRound(){
    round += 1
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func sliderMoved(_ slider: UISlider){
    print("The value of slider is: \(slider.value)")
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func showAlert() {
    let difference = abs(targetValue - currentValue)
    
    var points = 100 - difference
    
    let title : String
    
    if difference == 0 {
      title = "Perfect!"
      points += 100
    } else if difference < 5 {
      title = "You almost had it!"
      if difference == 1 {
        points += 50
      }
    } else if difference < 10 {
      title = "Pretty good!"
    } else {
      title = "Not even close"
    }
    
    score += points
    
    let message = "You scored \(points) points!"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Awesome", style: .default, handler: {
      action in
        self.startNewRound()
    })
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
  }
  
  @IBAction func startOverButtonPressed () {
    score = 0
    round = 0
    startNewRound()
  }

}

