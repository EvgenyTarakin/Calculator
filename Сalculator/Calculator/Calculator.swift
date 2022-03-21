//
//  Calculator.swift
//  Сalculator
//
//  Created by Евгений Таракин on 15.11.2021.
//

import UIKit

class Calculator {
    
    // MARK: Проперти калькулятора
    private var firstNumber: Double = 0
    private var secondNumber: Double = 0
    private var resault: Double = 0
    private var function: CustomButton.TypeButton?
    private var additionalFunction: CustomButton.TypeButton?
    
    private var newNumber = false
    private var presencePoint = false
    
    private var fullOperation: String = ""
    private var dataManager = DataManager()

    func setNumber(stringNumber: CustomButton.TypeButton, text: String) -> String {
        var text = text
        if text.isZero || newNumber == true {
            text.removeAll()
            newNumber = false
        } else if text.isMinusZero {
            text = "-"
        }
        
        text.append(stringNumber.rawValue)
        fullOperation.append(stringNumber.rawValue)
        
        if function == nil {
            firstNumber = text.doubleText
        } else {
            secondNumber = text.doubleText
        }
        return text
    }
    
    func addPoint(_ text: String) -> String {
        var text = text
        if !presencePoint {
            presencePoint.toggle()
            text.append(",")
            fullOperation.append(",")
        }
        return text
    }
    
    func chooseFunction(chooseFunction: CustomButton.TypeButton, text: String) -> String {
        if function != nil {
            let text = getResault(text)
            fullOperation.append(function?.rawValue ?? "")
            function = chooseFunction
            newNumber = true
            presencePoint = false
            return text
        }
        function = chooseFunction
        fullOperation.append(function?.rawValue ?? "")
        newNumber = true
        presencePoint = false
        return text
    }
    
    // MARK: Получение результата при использовании основных функций
    func getResault(_ text: String) -> String {
        switch function {
        case .addition:
            resault = firstNumber + secondNumber
        case .substraction:
            resault = firstNumber - secondNumber
        case .multiplication:
            resault = firstNumber * secondNumber
        case .division:
            resault = firstNumber / secondNumber
        default:
            break
        }
        newNumber = true
        secondNumber = 0

        firstNumber = resault
        return "\(resault)".textFormatting
    }
    
    // MARK: Получение результата при нажатии дополнительных функций
    func chooseAdditionalFunction(chooseAdditionalFunctional: CustomButton.TypeButton, text: String) -> String {
        firstNumber = text.doubleText
        additionalFunction = chooseAdditionalFunctional
        
        switch additionalFunction {
        case .invertion:
            firstNumber *= -1
        case .percent:
            firstNumber /= 100
        case .deletionState1:
            firstNumber = 0
            secondNumber = 0
            resault = 0
            function = nil
            additionalFunction = nil
            newNumber = false
            presencePoint = false
        default:
            break
        }

        return String(firstNumber).textFormatting
    }
    
    func displayResault(_ text: String) -> String {
        let text = getResault(text)
        dataManager.saveData(operations: fullOperation, resault: "= \(text)")
        clearOperations()
        return text
    }
    
    func clearOperations() {
        firstNumber = 0
        secondNumber = 0
        resault = 0
        function = nil
        additionalFunction = nil
        newNumber = true
        presencePoint = false
        fullOperation = ""
    }
 
}
