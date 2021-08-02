//
//  TransferViewController.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import UIKit
import RxSwift

class TransferViewController: UIViewController {

    let viewModel: TransferViewModel
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var selectedBank: UIButton!
    @IBAction func selectBank(_ sender: Any) {
        viewModel.showBankList()
    }
    

    init(viewModel: TransferViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "TransferViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transferência"
        subscribe()
    }
    
    private func subscribe() {
        viewModel.selectedBankState.subscribe { event in
            if let bank = event.element, let name = bank?.name {
                self.selectedBank.setTitle(name, for: .normal)
            }
        }.disposed(by: disposeBag)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
