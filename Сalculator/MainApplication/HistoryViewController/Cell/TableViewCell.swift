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

    // MARK: - property
    private lazy var operationsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .right
        label.numberOfLines = 0
//        label.
        
        return label
    }()
    
    private lazy var resaultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .right
        
        return label
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdentifire: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifire)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    MARK: - private func
    private func commonInit() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(resaultLabel)
        resaultLabel.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(operationsLabel)
        operationsLabel.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview().inset(16)
            make.right.equalTo(resaultLabel.snp.left).inset(-16)
        }
    }
    
    // MARK: - func 
    func configurate(_ item: TableData) {
        operationsLabel.text = item.operations
        resaultLabel.text = item.resault
    }
    
}
