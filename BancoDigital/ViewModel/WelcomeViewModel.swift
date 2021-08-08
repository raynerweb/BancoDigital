//
//  WelcomeViewModel.swift
//  BancoDigital
//
//  Created by rayner on 07/08/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol WelcomeCoordinator : AnyObject {
    
}

class WelcomeViewModel {
    
    let itensState = BehaviorSubject<[WelcomeItem]?>(value: nil)
    let statementErrorState = PublishSubject<String>()
    let loading = BehaviorSubject<Bool>(value: false)
    
    func fetchWelcomeItens() {
        self.loading.onNext(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            self.loading.onNext(false)
            do {
                let welcomeItens = try getWelcomeItens()
                itensState.onNext(welcomeItens)
            } catch {
                self.statementErrorState.onNext("Não foi possível recuperar o dados.")
            }
        }
    }
    
    private func getWelcomeItens() throws -> [WelcomeItem]  {
        return [
            BalanceWelcomeItem(
                balance: 4322.54
            ),
            CardWelcomeItem(
                invoiceValue: 8765.99,
                dueDate: Date(),
                limitAvailable: 31234.01,
                statusInvoice: "Fatura aberta"
            )
        ]
    }
    
}
