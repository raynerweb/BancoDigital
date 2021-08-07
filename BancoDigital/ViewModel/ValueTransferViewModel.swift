//
//  ValueTransferViewModel.swift
//  BancoDigital
//
//  Created by rayner on 06/08/21.
//

import Foundation

protocol ValueTransferCoordinator : AnyObject {
    func showSuccessful()
}

class ValueTransferViewModel {
    
    let coordinator: ValueTransferCoordinator
    
    init(coordinator: ValueTransferCoordinator) {
        self.coordinator = coordinator
    }
    
    
    func transfer() {
        coordinator.showSuccessful()
    }
}
