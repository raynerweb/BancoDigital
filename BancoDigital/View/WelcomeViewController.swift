//
//  WelcomeViewController.swift
//  BancoDigital
//
//  Created by rayner on 15/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class WelcomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    let viewModel: WelcomeViewModel
    let disposeBag = DisposeBag()
    
    private var welcomeItens = [WelcomeItem]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(_ viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "WelcomeViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BalanceTableViewCell.register(inside: self.tableView)
        CardTableViewCell.register(inside: self.tableView)
        CreditTableViewCell.register(inside: self.tableView)
        
        subscribe()
        viewModel.fetchWelcomeItens()
    }
    
    private func subscribe() {
        viewModel.itensState.subscribe { event in
            if let welcomeItens = event.element {
                self.welcomeItens = welcomeItens ?? []
            }
        }.disposed(by: disposeBag)
        viewModel.loading.bind(to: self.loading.rx.isAnimating).disposed(by: disposeBag)
    }

}

extension WelcomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return welcomeItens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let welcomeItem = welcomeItens[index]
        let itemType = welcomeItem.itemType
        
        switch itemType {
        case .balance:
            guard let balanceWelcomeItem = welcomeItem as? BalanceWelcomeItem else { break }
            let cell = tableView.dequeueReusableCell(withIdentifier: BalanceTableViewCell.kReuseIdentifier, for: indexPath) as! BalanceTableViewCell
            cell.setup(with: balanceWelcomeItem)
            return cell
            
        case .card:
            guard let cardWelcomeItem = welcomeItem as? CardWelcomeItem else { break }
            let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.kReuseIdentifier, for: indexPath) as! CardTableViewCell
            cell.setup(with: cardWelcomeItem)
            return cell
            
        case .creditLimit:
            guard let creditWelcomeItem = welcomeItem as? CreditWelcomeItem else { break }
            let cell = tableView.dequeueReusableCell(withIdentifier: CreditTableViewCell.kReuseIdentifier, for: indexPath) as! CreditTableViewCell
            cell.setup(with: creditWelcomeItem)
            return cell

        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.kReuseIdentifier, for: indexPath) as! CardTableViewCell
        return cell
    }
    
}

extension WelcomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        //560
        return 560
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
