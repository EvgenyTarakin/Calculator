//
//  ExtensionString.swift
//  Сalculator
//
//  Created by Евгений Таракин on 16.11.2021.
//

import UIKit

extension String {
    var textFormatting: String {
        return self.removeLastZero.replacingDotWithPoint
    }
    
    var doubleFormatting: String {
        return self.replacingPointWithDot
    }
    
    var doubleText: Double {
        return Double(self.doubleFormatting) ?? 0
    }
    
    private var removeLastZero: String {
        let splitValue = self.split(separator: ".")
        if splitValue.count > 1 && splitValue[1] == "0" {
            return String(splitValue[0])
        } else {
            return self
        }
    }
    
    private var replacingDotWithPoint: String {
        return self.replacingOccurrences(of: ".", with: ",")
    }
    
    private var replacingPointWithDot: String {
        return self.replacingOccurrences(of: ",", with: ".")
    }
    
    var isZero: Bool {
        return self == "0"
    }
    
    var isMinusZero: Bool {
        return self == "-0"
    }
}
