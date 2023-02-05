//
//  HistoryInteractor.swift
//  Сalculator
//
//  Created by Евгений Таракин on 09.12.2021.
//

import UIKit

protocol HistoryPresenterToInteractorProtocol {
    func loadData()
    func deleteData()
}


class HistoryInteractor {
    
    weak var presenter: HistoryInteractorToPresenterProtocol!
    private var dataManager = DataManager()
    
}

extension HistoryInteractor: HistoryPresenterToInteractorProtocol {
    func loadData() {
        presenter.didFinishUpdateData(dataManager.tableDatas)
    }
    
    func deleteData() {
        dataManager.deleteDatas()
        presenter.didFinishUpdateData(dataManager.tableDatas)
    }
}
