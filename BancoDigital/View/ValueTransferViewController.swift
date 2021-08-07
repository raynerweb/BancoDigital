//
//  ValueTransferViewController.swift
//  BancoDigital
//
//  Created by rayner on 05/08/21.
//

import UIKit

class ValueTransferViewController: UIViewController {

    let viewModel: ValueTransferViewModel
    
    init(viewModel: ValueTransferViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ValueTransferViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Informe o valor"
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        viewModel.transfer()
    }
    

}
