//
//  Question.swift
//  Quiz
//
//  Created by user on 25.09.17.
//  Copyright © 2017 Saulebekov Azamat. All rights reserved.
//

import UIKit

public class Question {
    var question: String
    var currentAnswer: String
    var correctAnswer : String
    var correct: Bool
    var variantArray: [String]
    
    init(que: String, cur: String, cor: String, corB: Bool, varA: [String]) {
        self.question = que
        self.currentAnswer = cur
        self.correctAnswer = cor
        self.correct = corB
        self.variantArray = varA
    }

}
