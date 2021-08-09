//
//  DateExtension.swift
//  BancoDigital
//
//  Created by rayner on 09/08/21.
//

import Foundation

extension Date {
    
    func format() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "pt_BR")
        return dateFormatter.string(from: self)
    }
}
