//
//  BankViewController.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class BankViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    let viewModel: BankViewModel
    let disposeBag = DisposeBag()
    
    private var filteredBanks: [Bank] {
        return banks.filter { bank in
            guard let filter = self.searchBar.text, filter != "" else {return true}
            return bank.name.lowercased().contains(filter.lowercased())
        }
    }
    
    private var banks = [Bank]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(viewModel: BankViewModel){
        self.viewModel = viewModel
        super.init(nibName: "BankViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Selecione o Banco"
        BankTableViewCell.register(inside: self.tableView)
        subscribe()
        viewModel.fetchBanks()
    }
    
    private func subscribe() {
        viewModel.bankState.subscribe { event in
            if let banks = event.element {
                self.banks = banks ?? []
            }
        }.disposed(by: disposeBag)
        
        viewModel.loading.bind(to: self.loading.rx.isAnimating).disposed(by: disposeBag)
        
        self.searchBar.rx.text.subscribe { _ in
            self.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
    

}

extension BankViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBanks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let bank = filteredBanks[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: BankTableViewCell.kReuseIdentifier, for: indexPath) as! BankTableViewCell
        cell.setup(with: bank)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let bank = filteredBanks[index]
        viewModel.selectBank(bank: bank)
        
    }
}

extension BankViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
