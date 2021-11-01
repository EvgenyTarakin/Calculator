//
//  CustomButton.swift
//  Сalculator
//
//  Created by Евгений Таракин on 01.11.2021.
//


import UIKit


class CustomButton {
    var value: Int?
    var functional: Functional?
    var additionalFunctional: AdditionalFunctional?
    var backgroundColor: UIColor?
    var tintColor: UIColor?
    
    init(value: Int?, functional: Functional?, additionalFunctional: AdditionalFunctional?) {
        self.value = value
        self.functional = functional
        self.additionalFunctional = additionalFunctional
        self.backgroundColor = UIColor.systemGray2
        self.tintColor = UIColor.white
        if functional != nil {
            self.backgroundColor = UIColor.systemOrange
            self.tintColor = UIColor.white
        }
        if additionalFunctional != nil {
            self.backgroundColor = UIColor.systemGray4
            self.tintColor = UIColor.black
        }
    }
}


enum Functional {
    case addition
    case substraction
    case multiplication
    case division
    case weaquals
}


enum AdditionalFunctional {
    case percent
    case deletion
    case invertion
}


var button = CustomButton(value: nil, functional: .addition, additionalFunctional: nil)
