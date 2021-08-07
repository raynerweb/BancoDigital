//
//  SuccessfulTransferViewModel.swift
//  BancoDigital
//
//  Created by rayner on 06/08/21.
//

import Foundation

protocol SuccessfulTransferCoordinator {
    func newTransfer()
}

class SuccessfulTransferViewModel {
    
    let coordinator: SuccessfulTransferCoordinator
    
    init(coordinator: SuccessfulTransferCoordinator) {
        self.coordinator = coordinator
    }
    
    
    func newTransfer() {
        coordinator.newTransfer()
    }
    
}
