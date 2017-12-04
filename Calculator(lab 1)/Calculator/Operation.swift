//
//  Operation.swift
//  Calculator
//
//  Created by user on 23.08.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit

class Operation: NSObject {
    func calculate(firstNumberText: String,  secondNumberText: String, op: String) -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }

}
