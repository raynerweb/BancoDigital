//
//  TransferViewModel.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import Foundation
import RxSwift

protocol TransferCoordinator: AnyObject {
    func showBankList()
    func showValueTransfer()
}

class TransferViewModel {
    
    let selectedBankState = BehaviorSubject<Bank?>(value: nil)
    
    let appCoordinator: TransferCoordinator
    
    init(appCoordinator: TransferCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    func showBankList() {
        appCoordinator.showBankList()
    }
    
    func selectBank(bank: Bank) {
        selectedBankState.onNext(bank)
    }
    
    func nextButton() {
        appCoordinator.showValueTransfer()
    }
    
}
