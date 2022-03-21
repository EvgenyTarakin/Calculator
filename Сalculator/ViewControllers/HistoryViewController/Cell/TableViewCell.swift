//
//  TableViewCell.swift
//  Table
//
//  Created by Евгений Таракин on 16.11.2021.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: TableViewCell.self)

    // MARK: Проперти ячейки
    private var operationsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    
    private var resaultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .right
        return label
    }()
    
    // MARK: Инициализация ячейки
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdentifire: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifire)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(resaultLabel)
        contentView.addSubview(operationsLabel)

        resaultLabel.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(28)
        }
        
        operationsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(resaultLabel.snp.centerY)
            make.right.equalTo(resaultLabel.snp.left)
        }
    }
    
    // MARK: Добавление данных
    func configurate(_ item: TableData) {
        operationsLabel.text = item.operations
        resaultLabel.text = item.resault
    }
    
}
