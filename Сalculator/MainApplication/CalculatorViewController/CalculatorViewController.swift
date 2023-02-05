//
//  ViewController.swift
//  Сalculator
//
//  Created by Евгений Таракин on 01.11.2021.
//

import UIKit
import SnapKit

// MARK: - protocols
protocol CalculatorPresenterToViewProtocol: AnyObject {
    func updateCheckLabel(_ text: String)
}

protocol CalculatorRouterToViewProtocol: AnyObject {
    func pushHistoryVC(_ viewController: UIViewController)
}

class CalculatorViewController: UIViewController {
    
    // MARK: - property
    var presenter: CalculatorViewToPresenterProtocol!
    
    private var arrayTypeButtons: [[AppButton.TypeButton]] = [
        [.deletion, .invertion, .percent, .division],
        [.seven, .eight, .nine, .multiplication],
        [.four, .five, .six, .substraction],
        [.one, .two, .three, .addition],
        [ .point, .receive]
    ]

    private lazy var historyButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = nil
        button.setImage(UIImage(systemName: "book"), for: .normal)
        button.addTarget(self, action: #selector(openHistoryViewController), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var checkLabel: AppLabel = {
        let label = AppLabel()
        label.text = "0"
        
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        return stackView
    }()
        
    // MARK: - lifecyrcle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        commonInit()
    }
    
//    MARK: - private func
    private func commonInit() {
        view.addSubview(historyButton)
        view.addSubview(mainStackView)
        view.addSubview(checkLabel)

        historyButton.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(-10)
            make.height.width.equalTo(50)
        })
        
        mainStackView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(mainStackView.snp.width).multipliedBy(1.25)
        }
        
        checkLabel.snp.makeConstraints { make in
            make.right.left.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(mainStackView.snp.top).inset(-16)
            make.height.equalTo(100)
        }
        
        for item in arrayTypeButtons {
            let newStackView = UIStackView()
            newStackView.axis = .horizontal
            newStackView.distribution = .fillEqually
            newStackView.spacing = 10
            
            if item == arrayTypeButtons.last {
                let zeroButton = AppButton(frame: .zero, typeButton: .zero)
                zeroButton.delegate = self
                newStackView.addArrangedSubview(zeroButton)
                
                let pointAndReceiveStackView = UIStackView()
                pointAndReceiveStackView.axis = .horizontal
                pointAndReceiveStackView.distribution = .fillEqually
                pointAndReceiveStackView.spacing = 10
                
                newStackView.addArrangedSubview(zeroButton)
                newStackView.addArrangedSubview(pointAndReceiveStackView)
                
                for button in item {
                    let customButton = AppButton(frame: .zero, typeButton: button)
                    customButton.delegate = self
                    pointAndReceiveStackView.addArrangedSubview(customButton)
                }
                
            } else {
                for button in item {
                    let customButton = AppButton(frame: .zero, typeButton: button)
                    customButton.delegate = self
                    newStackView.addArrangedSubview(customButton)
                }
            }

            mainStackView.addArrangedSubview(newStackView)
        }
    }

    // MARK: - obj-c
    @objc private func openHistoryViewController() {
        presenter.didSelectHistoryButton()        
    }

}

// MARK: - extensions
extension CalculatorViewController: AppButtonDelegate {
    func addNumber(_ stringNumber: AppButton.TypeButton) {
        presenter.didSelectNumberButton(stringNumber)
    }
    
    func addPoint() {
        presenter.didSelectPointButton()
    }
    
    func displayResault() {
        presenter.didSelectResaultButton()
    }
    
    func chooseFunctional(_ function: AppButton.TypeButton) {
        presenter.didSelectFunctionButton(function)
    }

    func chooseAdditionalFunctional(_ additionalfunction: AppButton.TypeButton) {
        presenter.didSelectAdditionalFunctionalButton(additionalfunction)
    }
}

extension CalculatorViewController: CalculatorRouterToViewProtocol {
    func pushHistoryVC(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CalculatorViewController: CalculatorPresenterToViewProtocol {
    func updateCheckLabel(_ text: String) {
        checkLabel.text = text
    }
}
