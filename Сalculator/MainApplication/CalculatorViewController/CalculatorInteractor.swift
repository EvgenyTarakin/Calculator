//
//  CalculatorInteractor.swift
//  Сalculator
//
//  Created by Евгений Таракин on 09.12.2021.
//

import UIKit

protocol CalculatorPresenterToInteractorProtocol: AnyObject {
    func addNumber(_ number: CustomButton.TypeButton)
    func addPoint()
    func addFunctional(_ functional: CustomButton.TypeButton)
    func addAdditionalFunctional(_ additionalFunctional: CustomButton.TypeButton)
    func loadResault()
}

class CalculatorInteractor {
    
    weak var presenter: CalculatorInteractorToPresenterProtocol!
    private var calculator = Calculator()
    private var checkLabelText: String = "0"
    
}

extension CalculatorInteractor: CalculatorPresenterToInteractorProtocol {
    func addNumber(_ number: CustomButton.TypeButton) {
        checkLabelText = calculator.setNumber(stringNumber: number, text: checkLabelText)
        presenter.didFinishUpdateCheckLabel(checkLabelText)
    }
    
    func addPoint() {
        checkLabelText = calculator.addPoint(checkLabelText)
        presenter.didFinishUpdateCheckLabel(checkLabelText)
    }
    
    func addFunctional(_ functional: CustomButton.TypeButton) {
        checkLabelText = calculator.chooseFunction(chooseFunction: functional, text: checkLabelText)
        presenter.didFinishUpdateCheckLabel(checkLabelText)
    }
    
    func addAdditionalFunctional(_ additionalFunctional: CustomButton.TypeButton) {
        checkLabelText = calculator.chooseAdditionalFunction(chooseAdditionalFunctional: additionalFunctional, text: checkLabelText)
        presenter.didFinishUpdateCheckLabel(checkLabelText)
    }
    
    func loadResault() {
        checkLabelText = calculator.displayResault(checkLabelText)
        presenter.didFinishUpdateCheckLabel(checkLabelText)
    }
}
