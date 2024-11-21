//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 30.10.24.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {               // 1
    func didReceiveNextQuestion(question: QuizQuestion?)    // 2
}
