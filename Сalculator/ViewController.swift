//
//  ViewController.swift
//  Сalculator
//
//  Created by Евгений Таракин on 01.11.2021.
//


import UIKit


class ViewController: UIViewController {
    
    @IBOutlet private weak var checkLabel: UILabel?
    
    @IBOutlet private var valueViewsArray: [UIView]?
    @IBOutlet private var valueLabelsArray: [UILabel]?
    @IBOutlet private var valueButtonsArray: [UIButton]?
    
    @IBOutlet private var functionalViewsArray: [UIView]?
    @IBOutlet private var functionalLabelsArray: [UILabel]?
    @IBOutlet private var functionalButtonsArray: [UIButton]?
    
    @IBOutlet private var additionalFunctionalViewsArray: [UIView]?
    @IBOutlet private var additionalFunctionalLabelsArray: [UILabel]?
    @IBOutlet private var additionalFunctionalButtonsArray: [UIButton]?
    
    @IBOutlet private weak var commaView: UIView?
    @IBOutlet private weak var commaLabel: UILabel?
    @IBOutlet private weak var commaButton: UIButton?
        
    private let functionalTexts = ["=","+", "-", "x", ":"]
    private var additionalFunctionalTexts = ["AC", "+/-", "%"]
    private var allButtons: [UIButton]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    
        checkLabel?.text = "0"
        
        addValuesButtons()
        commaButton?.addTarget(self, action: #selector(tapComma), for: .touchUpInside)
    }
    
    @objc func tapComma() {
        print("1")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        paintViewButtons()
    }
    
    private func paintViewButtons() {
        valueViewsArray?.forEach({ view in
            view.backgroundColor = .systemGray5
            view.layer.cornerRadius = view.frame.height / 2
        })
        
        functionalViewsArray?.forEach({ view in
            view.backgroundColor = .systemOrange
            view.layer.cornerRadius = view.frame.height / 2
        })
        
        additionalFunctionalViewsArray?.forEach({ view in
            view.backgroundColor = .systemGray
            view.layer.cornerRadius = view.frame.height / 2
        })
        
        guard let commaView = commaView else { return }
        commaView.backgroundColor = .systemGray5
        commaView.layer.cornerRadius = commaView.frame.height / 2
    }
    
    private func addValuesButtons() {
        guard let valueLabelsArray = valueLabelsArray,
              let functionalLabelsArray = functionalLabelsArray,
              let additionalFunctionalLabelsArray = additionalFunctionalLabelsArray,
              let valueButtonsArray = valueButtonsArray,
              let functionalButtonsArray = functionalButtonsArray,
              let additionalFunctionalButtonsArray = additionalFunctionalButtonsArray,
              let commaButton = commaButton
        else { return }
        
        for i in 0...valueLabelsArray.count - 1 {
            valueLabelsArray[i].text = "\(i)"
            valueLabelsArray[i].font = .systemFont(ofSize: 40)
        }
        
        for i in 0...functionalLabelsArray.count - 1 {
            functionalLabelsArray[i].text = functionalTexts[i]
            functionalLabelsArray[i].font = .boldSystemFont(ofSize: 40)
            functionalLabelsArray[i].textColor = .white
        }
        
        for i in 0...additionalFunctionalLabelsArray.count - 1 {
            additionalFunctionalLabelsArray[i].text = additionalFunctionalTexts[i]
            additionalFunctionalLabelsArray[i].font = .boldSystemFont(ofSize: 35)
            additionalFunctionalLabelsArray[i].textColor = .black
        }
 
        commaLabel?.text = ","
        commaLabel?.font = .systemFont(ofSize: 40)
        
        allButtons = valueButtonsArray + functionalButtonsArray + additionalFunctionalButtonsArray
        allButtons?.append(commaButton)
        
        allButtons?.forEach { button in
            button.titleLabel?.text = nil
        }
    }
    
    override func addChild(_ childController: UIViewController) {
        
    }
    
    @IBAction func tap0(_ sender: Any) {
        print("1")
    }
    
    
}

