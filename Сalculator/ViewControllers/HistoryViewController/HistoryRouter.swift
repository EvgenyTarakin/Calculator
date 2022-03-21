//
//  HistoryRouter.swift
//  Сalculator
//
//  Created by Евгений Таракин on 09.12.2021.
//

import UIKit

protocol HistoryPresenterToRouterProtocol: AnyObject {
    func comeBackCalculatorVC()
}

class HistoryRouter {
    
    weak var view: HistoryRouterToViewProtocol!
    
}

extension HistoryRouter: HistoryPresenterToRouterProtocol {

    func comeBackCalculatorVC() {
        view.popCalculatorVC()
    }

}
