//
//  ViewController.swift
//  Table
//
//  Created by Евгений Таракин on 16.11.2021.
//

import UIKit
import SnapKit

protocol HistoryPresenterToViewProtocol: AnyObject {
    func updateTable(_ data: [TableData])
}

protocol HistoryRouterToViewProtocol: AnyObject {
    func popCalculatorVC()
}

class HistoryViewController: UIViewController {
    
    // MARK: - property
    var presenter: HistoryViewToPresenterProtocol!

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(comeBackCalculatorVC), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.addTarget(self, action: #selector(deleteHistory), for: .touchUpInside)
        
        return button
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return tableView
    }()
        
    private lazy var dataSource = UITableViewDiffableDataSource<Section, TableData>(tableView: tableView) { (tableView, indexPath, item) -> UITableViewCell? in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.configurate(item)
        
        return cell
    }
    
    // MARK: - lifecyrcle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        commonInit()
        presenter.startLoadData()
    }
    
    // MARK: - private func
    private func commonInit() {
        view.addSubview(backButton)
        view.addSubview(deleteButton)
        view.addSubview(tableView)

        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.width.equalTo(50)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.width.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom)
            make.bottom.right.left.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //MARK: - obj-c
    @objc private func deleteHistory() {
        presenter.didSelectDeleteButton()
    }
    
    @objc private func comeBackCalculatorVC() {
        presenter.didSelectBackButton()
    }

}

extension HistoryViewController: HistoryRouterToViewProtocol {
    func popCalculatorVC() {
        navigationController?.popViewController(animated: true)
    }
}

extension HistoryViewController: HistoryPresenterToViewProtocol {
    func updateTable(_ data: [TableData]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, TableData>()
        snapshot.appendSections([.main])
        snapshot.appendItems(data, toSection: .main)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}
