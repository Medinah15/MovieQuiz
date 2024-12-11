//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 30.10.24.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
