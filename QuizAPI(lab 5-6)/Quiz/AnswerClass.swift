//
//  File.swift
//  Quiz
//
//  Created by Saulebekov Azamat on 12.09.17.
//  Copyright © 2017 Saulebekov Azamat. All rights reserved.
//

import Foundation

class Answer{
    var question: String
    var answer: String
    var correctAnswer : String
    var correct: Bool
    var questionId: Int
    init(_question: String, _answer: String, _correctAnswer: String, _correct: Bool, _questionId: Int) {
        self.question = _question
        self.answer = _answer
        self.correctAnswer = _correctAnswer
        self.correct = _correct
        self.questionId = _questionId
    }
}
