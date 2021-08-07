//
//  SuccessfulTransferViewController.swift
//  BancoDigital
//
//  Created by rayner on 06/08/21.
//

import UIKit

class SuccessfulTransferViewController: UIViewController {

    let viewModel: SuccessfulTransferViewModel
    
    init(viewModel: SuccessfulTransferViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SuccessfulTransferViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func newTransferButton(_ sender: Any) {
        viewModel.newTransfer()
    }


}
