//
//  DoubleExtension.swift
//  BancoDigital
//
//  Created by rayner on 09/08/21.
//

import Foundation

extension Double {
    
    func toMoney() -> String {
        let number = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        return formatter.string(from: number) ?? ""
    }
    
}
