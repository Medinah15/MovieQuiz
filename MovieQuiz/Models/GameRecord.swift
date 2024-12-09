//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 07.11.24.
//

import Foundation

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: GameRecord) -> Bool {
        correct > another.correct
    }
}
