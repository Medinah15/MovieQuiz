//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 07.11.24.
//

import Foundation

struct GameResult {
    let correct: Int
    let total: Int
    let date: Date

    // метод сравнения по количеству верных ответов
    func isBetterThan(_ another: GameResult) -> Bool {
        correct > another.correct
    }
}
