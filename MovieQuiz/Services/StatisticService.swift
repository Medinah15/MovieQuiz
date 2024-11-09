//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 07.11.24.
//

import Foundation

final class StatisticServiceImplementation: StatisticService {
    private let storage: UserDefaults = .standard

    private enum Keys: String {
        case gamesCount
        case bestGameCorrect
        case bestGameTotal
        case bestGameDate
        case totalCorrectAnswers
        case totalQuestions
    }

    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }

    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameCorrect.rawValue)
            let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
            let date = storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
            
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
            storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
            storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
        }
    }

    var totalAccuracy: Double {
        let correctAnswers = storage.integer(forKey: Keys.totalCorrectAnswers.rawValue)
        let totalQuestions = storage.integer(forKey: Keys.totalQuestions.rawValue)
        
        guard totalQuestions > 0 else { return 0.0 }
        
        return (Double(correctAnswers) / Double(totalQuestions)) * 100
    }

    func store(correct count: Int, total amount: Int) {
        gamesCount += 1

        let totalCorrect = storage.integer(forKey: Keys.totalCorrectAnswers.rawValue) + count
        let totalQuestions = storage.integer(forKey: Keys.totalQuestions.rawValue) + amount

        storage.set(totalCorrect, forKey: Keys.totalCorrectAnswers.rawValue)
        storage.set(totalQuestions, forKey: Keys.totalQuestions.rawValue)

        let currentGame = GameResult(correct: count, total: amount, date: Date())
        if currentGame.isBetterThan(bestGame) {
            bestGame = currentGame
        }
    }
}
 
