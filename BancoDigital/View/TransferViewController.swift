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
    
    var constraintTop: CGFloat?
    var constraintBottom: CGFloat?
    var constraintLeft: CGFloat?
    var constraintRight: CGFloat?

    
    @IBAction func favored(_ sender: Any) {
        if let segmentedControl = sender as? UISegmentedControl {
            let index = segmentedControl.selectedSegmentIndex
            if index == 0 {
                self.hideDocumentField()
            } else {
                self.showDocumentField()
            }
        }
        
    }
    

    @IBOutlet weak var favoredDocumentConstraintLeft: NSLayoutConstraint!
    @IBOutlet weak var favoredDocumentConstraintRight: NSLayoutConstraint!
    @IBOutlet weak var favoredDocumentContraintBottom: NSLayoutConstraint!
    @IBOutlet weak var favoredDocumentoConstraintTop: NSLayoutConstraint!
    @IBOutlet weak var favoredDocument: UIStackView!
    
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
        setupViews()
    }
    
    private func setupViews() {
        self.constraintTop = self.favoredDocumentoConstraintTop.constant
        self.constraintBottom = self.favoredDocumentContraintBottom.constant
        self.constraintRight = self.favoredDocumentConstraintRight.constant
        self.constraintLeft = self.favoredDocumentConstraintLeft.constant
        self.hideDocumentField()
    }
    
    private func subscribe() {
        viewModel.selectedBankState.subscribe { event in
            if let bank = event.element, let name = bank?.name {
                self.selectedBank.setTitle(name, for: .normal)
            }
        }.disposed(by: disposeBag)
    }
    
    private func hideDocumentField() {
        self.favoredDocumentoConstraintTop.constant = 0
        self.favoredDocumentContraintBottom.constant = 0
        self.favoredDocumentConstraintLeft.constant = 0
        self.favoredDocumentConstraintRight.constant = 0
        self.favoredDocument.isHidden = true
        self.view.layoutIfNeeded()
    }
    
    private func showDocumentField() {
        self.favoredDocumentoConstraintTop.constant = self.constraintTop ?? 0.0
        self.favoredDocumentContraintBottom.constant = self.constraintBottom ?? 0.0
        self.favoredDocumentConstraintLeft.constant = self.constraintLeft ?? 0.0
        self.favoredDocumentConstraintRight.constant = self.constraintRight ?? 0.0
        self.favoredDocument.isHidden = false
        self.view.layoutIfNeeded()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        viewModel.nextButton()
    }
    

}
