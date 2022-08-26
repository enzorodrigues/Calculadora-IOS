//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberButtonPressed(_ sender: UIButton) {
        bottomLabel.text! += sender.currentTitle!
    }
    
    @IBAction func operationButtomPressed(_ sender: UIButton) {
        topLabel.text! += "\(bottomLabel.text!) \(sender.currentTitle!) "
        
        bottomLabel.text! = ""
    }
    
    @IBAction func equalsButtonPressed(_ sender: Any) {
        let topEquation = topLabel.text!
        let bottomValues = bottomLabel.text!
        let equation = topEquation + bottomValues

        topLabel.text! = ""
        
        let result = NSExpression(format: equation)
        
        let v = result.expressionValue(with: nil, context: nil) ?? "Error!"
        
        bottomLabel.text! = "\(v)"
        
        
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        
        bottomLabel.text! = ""
        
    }
    
    @IBAction func clearButtonDoubleTouch(_ sender: Any) {
        topLabel.text! = ""
    }
    
    
    @IBAction func negateButtonPressed(_ sender: Any) {
        var value = bottomLabel.text!
        if value.contains("-"){
            value.removeFirst()
        }
        else {
            value = "-\(value)"
        }
        
        bottomLabel.text! = value
    }
    @IBAction func perCentButtonPressed(_ sender: Any) {
        let percent = "\(bottomLabel.text!)/100.0"
        let result = NSExpression(format: percent)
        
        let v = result.expressionValue(with: nil, context: nil) ?? "Error!"
        print(v)
        
        bottomLabel.text! = "\(v)"
    }
}

