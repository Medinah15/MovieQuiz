//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 04.11.24.
//

import Foundation
import UIKit

final class AlertPresenter {
    weak var viewController: UIViewController?
    
    func showAlert(with model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        alert.view.accessibilityIdentifier = "Game results"
        
        let action = UIAlertAction(
            title: model.buttonText,
            style: .default,
            handler: { _ in
                model.completion()
            }
        )
        
        alert.addAction(action)
        
        viewController?.present(alert, animated: true, completion: nil)
    }
}
