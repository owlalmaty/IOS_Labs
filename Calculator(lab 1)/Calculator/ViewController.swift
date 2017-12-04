//
//  ViewController.swift
//  Calculator
//
//  Created by user on 23.08.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var oper = Operation();
    
    @IBOutlet weak var CurrentText: UILabel!
    
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    @IBAction func buttonPress(_ sender: UIButton) {
        if canClear {
            CurrentText.text = ""
            canClear = false
        }
        let currentText = CurrentText.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "*", "/", "-":
                if hasOp {
                    if (secondNumberText == "" && firstNumberText != ""){
                        op = text
                        CurrentText.text = "\(firstNumberText) \(op) "
                    }
                    return
                }
                if (firstNumberText != ""){
                    op = text
                    isFirstNumber = false
                    hasOp = true
                    CurrentText.text = "\(currentText) \(op) "
                }
                break
            case "=":
                if(firstNumberText != "" && secondNumberText != ""){
                    isFirstNumber = true
                    hasOp = false
                    canClear = true
                    let result = oper.calculate(firstNumberText: firstNumberText, secondNumberText: secondNumberText, op: op)
                    if result.truncatingRemainder(dividingBy: 1) == 0 {
                        CurrentText.text = "\(Int(result))"
                    }else{
                        CurrentText.text = "\(result)"

                    }
                    firstNumberText = ""
                    secondNumberText = ""
                                    }
                break
           case "C":
                firstNumberText = ""
                secondNumberText = ""
                op = ""
                isFirstNumber = true
                hasOp = false
                canClear = true
                CurrentText.text = ""
                break
            default:
                if isFirstNumber {
                    if(firstNumberText == "0" && text != "."){
                        firstNumberText = "\(text)"
                        CurrentText.text = "\(text)"
                    }else{
                        firstNumberText = "\(firstNumberText)\(text)"
                        CurrentText.text = "\(currentText)\(text)"
                    }
                    
                } else {
                    if(secondNumberText == "0" && text != "."){
                        secondNumberText = "\(text)"
                        CurrentText.text = "\(currentText.substring(to: currentText.index(before: currentText.endIndex)))\(text)"
                    }else{
                        secondNumberText = "\(secondNumberText)\(text)"
                        CurrentText.text = "\(currentText)\(text)"
                    }
                }
                
                break;
            }
        }

    }
    
}

		
