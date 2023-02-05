//
//  AppLabel.swift
//  Сalculator
//
//  Created by Евгений Таракин on 10.11.2021.
//

import UIKit
import SnapKit

class AppLabel: UIView {
    
    // MARK: - property
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    private var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 100)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private var view: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    MARK: - private func
    private func commonInit() {
        addSubview(label)
        addSubview(view)
        
        label.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        view.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
}
