//
//  FinancialTransaction.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import Foundation

struct FinancialTransaction {
    let id: String
    let description: String
    let transactionValue: Double
    let transactionDate: Date
    let accountingTransaction: AccountingTransaction
}

enum AccountingTransaction {
    case credit
    case debit
}
