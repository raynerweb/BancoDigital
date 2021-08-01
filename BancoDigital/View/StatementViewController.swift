//
//  StatementViewController.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import UIKit

class StatementViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var statement = [FinancialTransaction]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FinancialTransactionTableViewCell.register(inside: self.tableView)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    

    
    

}

extension StatementViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let financialTransaction = statement[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: FinancialTransactionTableViewCell.kReuseIdentifier, for: indexPath) as! FinancialTransactionTableViewCell
        cell.setup(with: financialTransaction)
        return FinancialTransactionTableViewCell()
    }
}

extension StatementViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
