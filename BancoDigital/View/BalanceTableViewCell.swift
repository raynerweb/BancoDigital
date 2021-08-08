//
//  BalanceTableViewCell.swift
//  BancoDigital
//
//  Created by rayner on 08/08/21.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {

    static let kReuseIdentifier = "BalanceTableViewCell"
    
    static func register(inside tableView: UITableView) {
        let nib = UINib(nibName: kReuseIdentifier, bundle: Bundle(for: BalanceTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kReuseIdentifier)
    }
    
    func setup(with balance: BalanceWelcomeItem) {

    }
    
}
