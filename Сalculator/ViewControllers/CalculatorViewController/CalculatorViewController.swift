//
//  ViewController.swift
//  Сalculator
//
//  Created by Евгений Таракин on 01.11.2021.
//

import UIKit
import SnapKit

protocol CalculatorPresenterToViewProtocol: AnyObject {
    func updateCheckLabel(_ text: String)
}

protocol CalculatorRouterToViewProtocol: AnyObject {
    func pushHistoryVC(_ viewController: UIViewController)
}

class CalculatorViewController: UIViewController {
    
    // MARK: Пропети HistoryButton
    private lazy var historyButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = nil
        button.setImage(UIImage(systemName: "book"), for: .normal)
        button.addTarget(self, action: #selector(openHistoryViewController), for: .touchUpInside)
        return button
    }()
    
    // MARK: Пропети СheckLabel
    private lazy var checkLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "0"
        return label
    }()
    
    // MARK: Пропети StackViews
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: Массив типов кнопок
    private var arrayTypeButtons: [[CustomButton.TypeButton]] = [
        [.deletionState1, .invertion, .percent, .division],
        [.seven, .eight, .nine, .multiplication],
        [.four, .five, .six, .substraction],
        [.one, .two, .three, .addition],
        [ .point, .receive]
    ]
    
    var presenter: CalculatorViewToPresenterProtocol!
    
    // MARK: ViewController lifecyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configurateObjects()
    }
    
    // MARK: Настройка объектов
    private func configurateObjects() {
        view.addSubview(historyButton)
        view.addSubview(mainStackView)
        view.addSubview(checkLabel)

        historyButton.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(-10)
            make.height.width.equalTo(50)
        })
        
        mainStackView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(view.safeAreaLayoutGuide).inset(10)
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
                let zeroButton = CustomButton(frame: .zero, typeButton: .zero)
                zeroButton.delegate = self
                newStackView.addArrangedSubview(zeroButton)
                
                let pointAndReceiveStackView = UIStackView()
                pointAndReceiveStackView.axis = .horizontal
                pointAndReceiveStackView.distribution = .fillEqually
                pointAndReceiveStackView.spacing = 10
                
                newStackView.addArrangedSubview(zeroButton)
                newStackView.addArrangedSubview(pointAndReceiveStackView)
                
                for button in item {
                    let customButton = CustomButton(frame: .zero, typeButton: button)
                    customButton.delegate = self
                    pointAndReceiveStackView.addArrangedSubview(customButton)
                }
                
            } else {
                for button in item {
                    let customButton = CustomButton(frame: .zero, typeButton: button)
                    customButton.delegate = self
                    newStackView.addArrangedSubview(customButton)
                }
            }

            mainStackView.addArrangedSubview(newStackView)
        }
    }

    // MARK: Переход на HistoryViewController
    @objc private func openHistoryViewController() {
        presenter.didSelectHistoryButton()        
    }

}

extension CalculatorViewController: CustomButtonDelegate {
    
    func addNumber(_ stringNumber: CustomButton.TypeButton) {
        presenter.didSelectNumberButton(stringNumber)
    }
    
    func addPoint() {
        presenter.didSelectPointButton()
    }
    
    func displayResault() {
        presenter.didSelectResaultButton()
    }
    
    func chooseFunctional(_ function: CustomButton.TypeButton) {
        presenter.didSelectFunctionButton(function)
    }

    func chooseAdditionalFunctional(_ additionalfunction: CustomButton.TypeButton) {
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
