//
//  Calculator.swift
//  Сalculator
//
//  Created by Евгений Таракин on 15.11.2021.
//

import Foundation

class Calculator {
    
    // MARK: - property
    private var firstNumber: Double = 0
    private var secondNumber: Double = 0
    private var resault: Double = 0
    
    private var function: AppButton.TypeButton?
    private var additionalFunction: AppButton.TypeButton?
    
    private var isNewNumber = false
    private var presencePoint = false
    
    private var fullOperation: String = ""
    private var dataManager = DataManager()

    func setNumber(stringNumber: AppButton.TypeButton, text: String) -> String {
        var text = text
        if text.isZero || isNewNumber {
            text.removeAll()
            isNewNumber = false
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
        if !presencePoint && isNewNumber {
            presencePoint.toggle()
            text.append(",")
            fullOperation.append(",")
        }
        
        return text
    }
    
    func chooseFunction(chooseFunction: AppButton.TypeButton, text: String) -> String {
        if function != nil {
            let text = getResault(text)
            fullOperation.append(function?.rawValue ?? "")
            function = chooseFunction
            isNewNumber = true
            presencePoint = false
            
            return text
        }
        function = chooseFunction
        fullOperation.append(function?.rawValue ?? "")
        isNewNumber = true
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
        isNewNumber = true
        secondNumber = 0
        firstNumber = resault
        
        return "\(resault)".textFormatting
    }
    
    // MARK: Получение результата при нажатии дополнительных функций
    func chooseAdditionalFunction(chooseAdditionalFunctional: AppButton.TypeButton, text: String) -> String {
        firstNumber = text.doubleText
        additionalFunction = chooseAdditionalFunctional
        
        switch additionalFunction {
        case .invertion:
            firstNumber *= -1
        case .percent:
            firstNumber /= 100
        case .deletion:
            firstNumber = 0
            secondNumber = 0
            resault = 0
            function = nil
            additionalFunction = nil
            isNewNumber = false
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
        isNewNumber = true
        presencePoint = false
        fullOperation = ""
    }
 
}
