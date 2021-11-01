//
//  ViewController.swift
//  Сalculator
//
//  Created by Евгений Таракин on 01.11.2021.
//


import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var checkLabel: UILabel?
    
    @IBOutlet var valueViewsArray: [UIView]?
    @IBOutlet var valueLabelsArray: [UILabel]?
    @IBOutlet var valueButtonsArray: [UIButton]?
    
    @IBOutlet var functionalViewsArray: [UIView]?
    @IBOutlet var functionalLabelsArray: [UILabel]?
    let functionalTexts = ["=","+", "-", "x", ":"]
    @IBOutlet var functionalButtonsArray: [UIButton]?
    
    @IBOutlet var additionalFunctionalViewsArray: [UIView]?
    @IBOutlet var additionalFunctionalLabelsArray: [UILabel]?
    var additionalFunctionalTexts = ["AC", "+/-", "%"]
    @IBOutlet var additionalFunctionalButtonsArray: [UIButton]?
    
    @IBOutlet weak var commaView: UIView?
    @IBOutlet weak var commaLabel: UILabel?
    @IBOutlet weak var commaButton: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    
        checkLabel?.text = "0"
        
        paintViewButtons()
        addValuesButtons()
    }
    
    func paintViewButtons() {
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
    
    func addValuesButtons() {
        guard let valueLabelsArray = valueLabelsArray,
              let functionalLabelsArray = functionalLabelsArray,
              let additionalFunctionalLabelsArray = additionalFunctionalLabelsArray else { return }
        
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
    }
    
    func addActionsButtons() {
        guard let valueButtonsArray = valueButtonsArray else { return }
        for i in 0...valueButtonsArray.count - 1 {
            valueButtonsArray[i].addTarget(self, action: #selector(addNumber), for: .touchUpInside)
        }
    }
    
    @objc func addNumber() {
        
    }
    
}

