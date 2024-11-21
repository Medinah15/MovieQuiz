//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Medina Huseynova on 04.11.24.
//

import UIKit

class AlertPresenter {
    
    func presentAlert(from viewController: MovieQuizViewController?, with model: AlertModel?) {
        
        let alertController = UIAlertController(title: model?.title, message: model?.message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: model?.buttonText, style: .default) { _ in
            model?.completion()
        }
        
        alertController.addAction(action)
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
