//
//  ViewController.swift
//  Calculator
//
//  Created by 买明 on 15/02/2017.
//  Copyright © 2017 买明. All rights reserved.
//  [Powered by kingcos](https://github.com/kingcos/CS193P_2017)

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    // 存储属性
    var userIsInTheMiddleOfTyping = false
    
    // 计算属性
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
        
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        userIsInTheMiddleOfTyping = false
        
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
        
    }
    
}

