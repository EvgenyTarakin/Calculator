//
//  CalculatorConfigurator.swift
//  Сalculator
//
//  Created by Евгений Таракин on 09.12.2021.
//

import UIKit

class CalculatorConfigurator {
    
    func configurate() -> UIViewController {
        let view = CalculatorViewController()
        let presenter = CalculatorPresenter()
        let interactor = CalculatorInteractor()
        let router = CalculatorRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
