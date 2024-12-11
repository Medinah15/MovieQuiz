//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 04.11.24.
//

import Foundation

struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    var completion: () -> Void
}
