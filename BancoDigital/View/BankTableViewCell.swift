//
//  BankTableViewCell.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import UIKit
import Swift

class BankTableViewCell: UITableViewCell {

    static let kReuseIdentifier = "BankTableViewCell"
    
    @IBOutlet weak var bankName: UILabel!
    
    static func register(inside tableView: UITableView) {
        let nib = UINib(nibName: kReuseIdentifier, bundle: Bundle(for: BankTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kReuseIdentifier)
    }
    
    func setup(with bank: Bank) {
        let number = String(bank.number).padding(toLength: 3, withPad: "0", startingAt: 0)
        self.bankName.text = "\(number) - \(bank.name)"
    }
    
    
}
