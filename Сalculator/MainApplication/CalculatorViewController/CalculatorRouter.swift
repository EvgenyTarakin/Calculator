//
//  CalculatorRouter.swift
//  Сalculator
//
//  Created by Евгений Таракин on 09.12.2021.
//

import UIKit

protocol CalculatorPresenterToRouterProtocol: AnyObject {
    func openHistoryVC()
}

class CalculatorRouter {
    
    weak var view: CalculatorRouterToViewProtocol!
    
}

extension CalculatorRouter: CalculatorPresenterToRouterProtocol {
    func openHistoryVC() {
        let historyViewController = HistoryConfigurator().configurate()
        view.pushHistoryVC(historyViewController)
    }
}
