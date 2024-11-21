//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 07.11.24.
//

import Foundation

protocol StatisticService {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameResult { get }

    func store(correct count: Int, total amount: Int)
}
