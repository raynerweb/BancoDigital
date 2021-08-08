//
//  WelcomeItem.swift
//  BancoDigital
//
//  Created by rayner on 07/08/21.
//

import Foundation

protocol WelcomeItem {
    var itemType: WelcomeItemType { get }
}

enum WelcomeItemType {
    case card
    case balance
    case creditLimit
    case cashback
    case investiments
}

struct CardWelcomeItem : WelcomeItem {
    let itemType: WelcomeItemType = .card
    let invoiceValue: Double
    let dueDate: Date
    let limitAvailable: Double
    let statusInvoice: String
}
