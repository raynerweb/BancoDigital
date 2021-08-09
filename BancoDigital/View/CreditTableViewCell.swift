//
//  CreditTableViewCell.swift
//  BancoDigital
//
//  Created by rayner on 08/08/21.
//

import UIKit

class CreditTableViewCell: UITableViewCell {

    @IBOutlet weak var limitValue: UILabel!
    
    static let kReuseIdentifier = "CreditTableViewCell"
    
    static func register(inside tableView: UITableView) {
        let nib = UINib(nibName: kReuseIdentifier, bundle: Bundle(for: CreditTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kReuseIdentifier)
    }
    
    func setup(with credit: CreditWelcomeItem) {
        limitValue.text = credit.limitValue.toMoney()
    }
    
}
