//
//  BankTransfer.swift
//  BancoDigital
//
//  Created by rayner on 09/08/21.
//

import Foundation

struct BankTransfer{
    let bank: Bank
    let favored: Favored
    let accountType: AccountType
    let branch, account: String
    let value: Double
}

enum Favored {
    case mySelf
    case others
}

enum AccountType {
    case checkingAccount
    case savingsAccount
}
