//
//  CalculatorPresenter.swift
//  Сalculator
//
//  Created by Евгений Таракин on 09.12.2021.
//

import UIKit

protocol CalculatorViewToPresenterProtocol: AnyObject {
    func didSelectNumberButton(_ number: CustomButton.TypeButton)
    func didSelectPointButton()
    func didSelectResaultButton()
    func didSelectFunctionButton(_ functional: CustomButton.TypeButton)
    func didSelectAdditionalFunctionalButton(_ additionalFunctional: CustomButton.TypeButton)
    func didSelectHistoryButton()
}

protocol CalculatorInteractorToPresenterProtocol: AnyObject {
    func didFinishUpdateCheckLabel(_ text: String)
}

class CalculatorPresenter {
    
    weak var view: CalculatorPresenterToViewProtocol!
    var interactor: CalculatorPresenterToInteractorProtocol!
    var router: CalculatorPresenterToRouterProtocol!
    
}

extension CalculatorPresenter: CalculatorViewToPresenterProtocol {
    func didSelectNumberButton(_ number: CustomButton.TypeButton) {
        interactor.addNumber(number)
    }
    
    func didSelectPointButton() {
        interactor.addPoint()
    }
    
    func didSelectResaultButton() {
        interactor.loadResault()
    }
    
    func didSelectFunctionButton(_ functional: CustomButton.TypeButton) {
        interactor.addFunctional(functional)
    }
    
    func didSelectAdditionalFunctionalButton(_ additionalFunctional: CustomButton.TypeButton) {
        interactor.addAdditionalFunctional(additionalFunctional)
    }

    func didSelectHistoryButton() {
        router.openHistoryVC()
    }
}

extension CalculatorPresenter: CalculatorInteractorToPresenterProtocol {
    func didFinishUpdateCheckLabel(_ text: String) {
        view.updateCheckLabel(text)
    }
}
