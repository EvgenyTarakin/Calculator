//
//  HistoryPresenter.swift
//  Сalculator
//
//  Created by Евгений Таракин on 09.12.2021.
//

import UIKit

protocol HistoryViewToPresenterProtocol: AnyObject {
    func didSelectBackButton()
    func didSelectDeleteButton()
    func startLoadData()
}

protocol HistoryInteractorToPresenterProtocol: AnyObject {
    func didFinishUpdateData(_ data: [TableData])
}

class HistoryPresenter {
    
    weak var view: HistoryPresenterToViewProtocol!
    var interactor: HistoryPresenterToInteractorProtocol!
    var router: HistoryPresenterToRouterProtocol!
    
}

extension HistoryPresenter: HistoryViewToPresenterProtocol {
    func didSelectBackButton() {
        router.comeBackCalculatorVC()
    }
    
    func didSelectDeleteButton() {
        interactor.deleteData()
    }
    
    func startLoadData() {
        interactor.loadData()
    }
}

extension HistoryPresenter: HistoryInteractorToPresenterProtocol {
    func didFinishUpdateData(_ data: [TableData]) {
        view.updateTable(data)
    }
}
