import UIKit

final class MovieQuizViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
   
    private var presenter: MovieQuizPresenter!
    private var currentQuestion: QuizQuestion?
    
    private var alertPresenter = AlertPresenter()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MovieQuizPresenter(viewController: self)
        imageView.layer.cornerRadius = 20
       
    }
    
    
    // MARK: - Actions
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
           presenter.yesButtonClicked()
       }
       
       @IBAction private func noButtonClicked(_ sender: UIButton) {
           presenter.noButtonClicked()
       }
    // MARK: - Private functions
    
    func show(quiz step: QuizStepViewModel) {
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    func show(quiz result: QuizResultsViewModel) {
        let message = presenter.makeResultsMessage()
            
            let alert = UIAlertController(
                        title: result.title,
                        message: message,
                        preferredStyle: .alert)
            
            let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
                guard let self = self else { return }
                
                self.presenter.restartGame()
            }
            
            alert.addAction(action)
                    
            self.present(alert, animated: true, completion: nil)
        }
    
        
        func showAnswerResult(isCorrect: Bool) {
            presenter.didAnswer(isCorrectAnswer: isCorrect)
            
            
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 8
            imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                       guard let self = self else { return }
                       self.presenter.showNextQuestionOrResults()
                   }
        }
    
    func hideLoadingIndicator() {
           activityIndicator.isHidden = true
       }
       
        
        private func showNextQuestionOrResults() {
            if presenter.isLastQuestion() {
                let text = "Вы ответили на \(presenter.correctAnswers) из 10, попробуйте еще раз!"
                
                let viewModel = QuizResultsViewModel(
                    title: "Этот раунд окончен!",
                    text: text,
                    buttonText: "Сыграть ещё раз")
                show(quiz: viewModel)
            } else {
                presenter.switchToNextQuestion()
                self.presenter.restartGame()
            }
        }
        
         func showLoadingIndicator() {
            activityIndicator.isHidden = false // говорим, что индикатор загрузки не скрыт
            activityIndicator.startAnimating() // включаем анимацию
        }
        
        func showNetworkError(message: String) {
            activityIndicator.isHidden = true // скрываем индикатор загрузки
            
            let alert = UIAlertController(
                title: "Ошибка",
                message: message,
                preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Попробовать еще раз",
                                       style: .default) { [weak self] _ in
                guard let self = self else { return }
                
                self.presenter.restartGame()
                
            }
            
            alert.addAction(action)
        }
    }

