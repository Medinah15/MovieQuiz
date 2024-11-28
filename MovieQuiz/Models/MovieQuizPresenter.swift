//
//  MovieQuizPresenter.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 27.11.24.
//

import UIKit

final class MovieQuizPresenter {
    let questionsAmount: Int = 10
    private var currentQuestionIndex: Int = 0
    var currentQuestion: QuizQuestion?
    weak var viewController: MovieQuizViewController?
    
        
    func yesButtonClicked() {
           guard let currentQuestion = currentQuestion else {
               return
           }
           
           let givenAnswer = true
           
           viewController?.showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
       }
    
    func noButtonClicked() {
            guard let currentQuestion = currentQuestion else {
                return
            }
            
            let givenAnswer = false
            
            viewController?.showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
        }
    
    func isLastQuestion() -> Bool {
        currentQuestionIndex == questionsAmount - 1
    }
    
    func resetQuestionIndex() {
        currentQuestionIndex = 0
    }
    
    func switchToNextQuestion() {
        currentQuestionIndex += 1
    }


    func convert(model: QuizQuestion) -> QuizStepViewModel {
        QuizStepViewModel(
            image: UIImage(data: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)" // 
        )
    }
}

