//
//  HistoryConfigurator.swift
//  Сalculator
//
//  Created by Евгений Таракин on 09.12.2021.
//

import UIKit

class HistoryConfigurator {
    
    func configurate() -> UIViewController {
        let view = HistoryViewController()
        let presenter = HistoryPresenter()
        let interactor = HistoryInteractor()
        let router = HistoryRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
