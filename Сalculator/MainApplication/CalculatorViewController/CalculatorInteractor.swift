//
//  CalculatorInteractor.swift
//  Сalculator
//
//  Created by Евгений Таракин on 09.12.2021.
//

import UIKit

protocol CalculatorPresenterToInteractorProtocol: AnyObject {
    func addNumber(_ number: AppButton.TypeButton)
    func addPoint()
    func addFunctional(_ functional: AppButton.TypeButton)
    func addAdditionalFunctional(_ additionalFunctional: AppButton.TypeButton)
    func loadResault()
}

class CalculatorInteractor {
    
    weak var presenter: CalculatorInteractorToPresenterProtocol!
    private var calculator = Calculator()
    private var textLabel: String = "0"
    
}

extension CalculatorInteractor: CalculatorPresenterToInteractorProtocol {
    func addNumber(_ number: AppButton.TypeButton) {
        textLabel = calculator.setNumber(stringNumber: number, text: textLabel)
        presenter.didFinishUpdateCheckLabel(textLabel)
    }
    
    func addPoint() {
        textLabel = calculator.addPoint(textLabel)
        presenter.didFinishUpdateCheckLabel(textLabel)
    }
    
    func addFunctional(_ functional: AppButton.TypeButton) {
        textLabel = calculator.chooseFunction(chooseFunction: functional, text: textLabel)
        presenter.didFinishUpdateCheckLabel(textLabel)
    }
    
    func addAdditionalFunctional(_ additionalFunctional: AppButton.TypeButton) {
        textLabel = calculator.chooseAdditionalFunction(chooseAdditionalFunctional: additionalFunctional, text: textLabel)
        presenter.didFinishUpdateCheckLabel(textLabel)
    }
    
    func loadResault() {
        textLabel = calculator.displayResault(textLabel)
        presenter.didFinishUpdateCheckLabel(textLabel)
    }
}
