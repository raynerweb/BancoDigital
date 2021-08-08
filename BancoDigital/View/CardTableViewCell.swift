//
//  CardTableViewCell.swift
//  BancoDigital
//
//  Created by rayner on 07/08/21.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    static let kReuseIdentifier = "CardTableViewCell"
    
    static func register(inside tableView: UITableView) {
        let nib = UINib(nibName: kReuseIdentifier, bundle: Bundle(for: CardTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kReuseIdentifier)
    }
    
    func setup(with cardWelcomeItem: CardWelcomeItem) {

    }
    
}
