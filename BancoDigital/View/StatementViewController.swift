//
//  StatementViewController.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class StatementViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    let viewModel: StatementViewModel
    let disposeBag = DisposeBag()
    
    private var statement = [FinancialTransaction]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(_ viewModel: StatementViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "StatementViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
        FinancialTransactionTableViewCell.register(inside: self.tableView)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchStatement()
    }
    
    private func subscribe() {
        viewModel.statementState.subscribe { event in
            if let statement = event.element {
                self.statement = statement ?? []
            }
        }.disposed(by: disposeBag)
        viewModel.loading.bind(to: self.loading.rx.isAnimating).disposed(by: disposeBag)
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
        return cell
    }
}

extension StatementViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
