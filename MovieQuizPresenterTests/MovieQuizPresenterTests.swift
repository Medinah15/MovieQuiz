//
//  MovieQuizPresenterTests.swift
//  MovieQuizPresenterTests
//
//  Created by Medina Huseynova on 28.11.24.
//

import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    
    var isShowQuizStepCalled = false
    var isShowQuizResultCalled = false
    var isHighlightImageBorderCalled = false
    var isShowLoadingIndicatorCalled = false
    var isHideLoadingIndicatorCalled = false
    var isShowNetworkErrorCalled = false
    
    
    func show(quiz step: QuizStepViewModel) {
        isShowQuizStepCalled = true
    }
    
    func show(quiz result: QuizResultsViewModel) {
        isShowQuizResultCalled = true
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        isHighlightImageBorderCalled = true
    }
    
    func showLoadingIndicator() {
        isShowLoadingIndicatorCalled = true
    }
    
    func hideLoadingIndicator() {
        isHideLoadingIndicatorCalled = true
    }
    
    func showNetworkError(message: String) {
        isShowNetworkErrorCalled = true
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    
    private var presenter: MovieQuizPresenter!
    private var viewControllerMock: MovieQuizViewControllerMock!
    
    override func setUpWithError() throws {
        viewControllerMock = MovieQuizViewControllerMock()
        presenter = MovieQuizPresenter(viewController: viewControllerMock)
    }
    
    override func tearDownWithError() throws {
        presenter = nil
        viewControllerMock = nil
    }
    
    // MARK: - Tests
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}
