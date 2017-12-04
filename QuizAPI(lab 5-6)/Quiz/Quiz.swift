//
//  Quiz.swift
//  Quiz
//
//  Created by user on 25.09.17.
//  Copyright © 2017 Saulebekov Azamat. All rights reserved.
//

import UIKit

class Quiz {
    static let sharedInstance = Quiz()
    
    func generate(arrQue: Array<Question>) -> Array<Question> {
        var arrList: Array<Question> = []
        var allNumber: Array<Int> = []
        for _ in 0..<5{
            var notExist: Bool = true
            while notExist {
                let inumber = randomNumber()
                if !allNumber.contains(inumber) {
                    allNumber.append(inumber)
                    arrList.append(arrQue[inumber] as Question)
                    notExist = false
                }
            }            
        }
        return arrList
    }
    
    func randomNumber(range: ClosedRange<Int> = 0...6) -> Int {
        let min = range.lowerBound
        let max = range.upperBound
        return Int(arc4random_uniform(UInt32(1 + max - min))) + min
    }
    
    init() {
    }
}
