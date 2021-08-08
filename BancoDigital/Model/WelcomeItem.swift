//
//  WelcomeItem.swift
//  BancoDigital
//
//  Created by rayner on 07/08/21.
//

import Foundation

protocol WelcomeItem {
    var welcomeItemType: WelcomeItemType { get }
}

enum WelcomeItemType {
    case card
    case balance
    case creditLimit
    case cashback
    case investiments
}
