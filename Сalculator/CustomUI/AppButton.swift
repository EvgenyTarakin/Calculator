//
//  AppButton.swift
//  Сalculator
//
//  Created by Евгений Таракин on 01.11.2021.
//

import UIKit
import SnapKit

// MARK: - protocol
protocol AppButtonDelegate: AnyObject {
    func addNumber(_ stringNumber: AppButton.TypeButton)
    func addPoint()
    func displayResault()
    func chooseFunctional(_ function: AppButton.TypeButton)
    func chooseAdditionalFunctional(_ additionalfunction: AppButton.TypeButton)
}

class AppButton: UIView {
   
//    MARK: - TypeButton
    enum TypeButton: String, CaseIterable {
        case deletion = "AC"
        
        case percent = "%"
        case invertion = "+/-"
        case division = "/"
        
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case multiplication = "*"

        case four = "4"
        case five = "5"
        case six = "6"
        case substraction = "-"

        case one = "1"
        case two = "2"
        case three = "3"
        case addition = "+"

        case zero = "0"
        case point = ","
        case receive = "="
        
        var backgrondColor: UIColor {
            switch self {
            case .division, .multiplication, .substraction, .addition, .receive:
                return .systemOrange
            case .deletion, .invertion, .percent:
                return .systemGray
            default:
                return .systemGray3
            }
        }
        
        var font: UIFont {
            switch self {
            case .division, .multiplication, .substraction, .addition, .receive:
                return .boldSystemFont(ofSize: 35)
            default:
                return .boldSystemFont(ofSize: 40)
            }
        }
        
        var textColor: UIColor {
            switch self {
            case .deletion, .invertion, .percent:
                return .black
            default:
                return .white
            }
        }
    }
    
    // MARK: - property
    private var typeButton: TypeButton?

    weak var delegate: AppButtonDelegate?
    
    private let backView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = nil
        button.backgroundColor = . clear
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Инициализация СustomButton
    init(frame: CGRect, typeButton: TypeButton) {
        super.init(frame: frame)
        self.typeButton = typeButton
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
        backView.layer.cornerRadius = layer.cornerRadius
        
        clipsToBounds = true
    }
    
    // MARK: - private func
    private func commonInit() {
        guard let typeButton = typeButton else { return }
        
        backgroundColor = .white

        text = typeButton.rawValue
        label.font = typeButton.font
        label.textColor = typeButton.textColor
        
        backView.backgroundColor = typeButton.backgrondColor
        
        addSubview(backView)
        addSubview(label)
        addSubview(button)

        backView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        label.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    private func playAnimation() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")

        switch typeButton {
        case .division, .multiplication, .substraction, .addition, .receive:
            animation.fromValue = UIColor.systemOrange.cgColor
            animation.toValue = UIColor.systemOrange.withAlphaComponent(0.3).cgColor
        case .deletion, .invertion, .percent:
            animation.fromValue = UIColor.systemGray.cgColor
            animation.toValue = UIColor.systemGray.withAlphaComponent(0.7).cgColor
        default:
            animation.fromValue = UIColor.systemGray3.cgColor
            animation.toValue = UIColor.systemGray3.withAlphaComponent(0.7).cgColor
        }

        animation.duration = 0.1
        animation.repeatCount = 1
        backView.layer.add(animation, forKey: "backgroundColor")
    }
    
    // MARK: - obj-c
    @objc private func tapButton() {
        playAnimation()
        guard let typeButton = typeButton else { return }
        switch typeButton {
        case .point:
            delegate?.addPoint()
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            delegate?.addNumber(typeButton)
        case .receive:
            delegate?.displayResault()
        case .addition, .substraction, .multiplication, .division:
            delegate?.chooseFunctional(typeButton)
        case .deletion, .invertion, .percent:
            delegate?.chooseAdditionalFunctional(typeButton)
        }
    }
    
}
