//
//  BankViewModel.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import Foundation
import RxSwift

protocol BankCoordinator: AnyObject {
    func selectBank(bank: Bank)
}

class BankViewModel {
    
    var bankCoordinator: BankCoordinator
    let bankState = BehaviorSubject<[Bank]?>(value: nil)
    let bankErrorState = PublishSubject<String>()
    let loading = BehaviorSubject<Bool>(value: false)
    
    init(bankCoordinator: BankCoordinator) {
        self.bankCoordinator = bankCoordinator
    }
    
    func fetchBanks() {
        self.loading.onNext(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            self.loading.onNext(false)
            do {
                let banks = try getBanks()
                bankState.onNext(banks)
            } catch {
                self.bankErrorState.onNext("Não foi possível recuperar a lista de Bancos.")
            }
        }
    }
    
    func selectBank(bank: Bank) {
        self.bankCoordinator.selectBank(bank: bank)
    }
    
    private func getBanks() throws -> [Bank] {
        return [
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Digital",
                number: 999
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Original",
                number: 212
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Itau Unibanco",
                number: 341
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco do Brasil",
                number: 001
            ),
            Bank(
                id: UUID.init().uuidString,
                name: "Banco Santander",
                number: 033
            ),
        ]
    }
    
}
