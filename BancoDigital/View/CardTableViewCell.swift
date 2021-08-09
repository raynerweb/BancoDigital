//
//  CardTableViewCell.swift
//  BancoDigital
//
//  Created by rayner on 07/08/21.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var statusInvoice: UILabel!
    @IBOutlet weak var invoiceValue: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var limitAvailable: UILabel!
    
    static let kReuseIdentifier = "CardTableViewCell"
    
    static func register(inside tableView: UITableView) {
        let nib = UINib(nibName: kReuseIdentifier, bundle: Bundle(for: CardTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kReuseIdentifier)
    }
    
    func setup(with cardWelcomeItem: CardWelcomeItem) {
        self.statusInvoice.text = cardWelcomeItem.statusInvoice
        self.invoiceValue.text = cardWelcomeItem.invoiceValue.toMoney()
        self.dueDate.text = cardWelcomeItem.dueDate.format()
        self.limitAvailable.text = cardWelcomeItem.limitAvailable.toMoney()
    }
    
}
