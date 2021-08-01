//
//  FinancialTransactionTableViewCell.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import UIKit

class FinancialTransactionTableViewCell: UITableViewCell {

    static let kReuseIdentifier = "FinancialTransactionTableViewCell"
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var transactionValueLabel: UILabel!
    
    static func register(inside tableView: UITableView) {
        let nib = UINib(nibName: kReuseIdentifier, bundle: Bundle(for: FinancialTransactionTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kReuseIdentifier)
    }
    
    func setup(with financialTransaction: FinancialTransaction) {
        descriptionLabel.text = financialTransaction.description
        let currency = String(format: "R$%.02f", financialTransaction.transactionValue)
        transactionValueLabel.text = currency
        
        if financialTransaction.accountingTransaction == .debit {
            transactionValueLabel.textColor = .red
        } else {
            transactionValueLabel.textColor = .green
        }
    }
    
}
