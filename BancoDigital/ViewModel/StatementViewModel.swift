//
//  StatementViewModel.swift
//  BancoDigital
//
//  Created by rayner on 01/08/21.
//

import Foundation
import RxSwift

class StatementViewModel {
    
    let statementState = BehaviorSubject<[FinancialTransaction]?>(value: nil)
    let statementErrorState = PublishSubject<String>()
    let loading = BehaviorSubject<Bool>(value: false)
    
    func fetchStatement() {
        self.loading.onNext(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            self.loading.onNext(false)
            do {
                let statement = try getStatement()
                statementState.onNext(statement)
            } catch {
                self.statementErrorState.onNext("Não foi possível recuperar o Extrato bancário.")
            }
        }
    }
    
    private func getStatement() throws -> [FinancialTransaction]  {
        return [
            FinancialTransaction(
                id: UUID.init().uuidString,
                description: "Mercado", transactionValue: 721.12,
                transactionDate: Date(),
                accountingTransaction: .debit
            ),
            FinancialTransaction(
                id: UUID.init().uuidString,
                description: "Remuneração", transactionValue: 17321.12,
                transactionDate: Date(),
                accountingTransaction: .credit
            ),
            FinancialTransaction(
                id: UUID.init().uuidString,
                description: "Restaurante", transactionValue: 41.42,
                transactionDate: Date(),
                accountingTransaction: .debit
            ),
            FinancialTransaction(
                id: UUID.init().uuidString,
                description: "Farmácia", transactionValue: 123.32,
                transactionDate: Date(),
                accountingTransaction: .debit
            ),
            FinancialTransaction(
                id: UUID.init().uuidString,
                description: "Padaria", transactionValue: 8.35,
                transactionDate: Date(),
                accountingTransaction: .debit
            ),
            FinancialTransaction(
                id: UUID.init().uuidString,
                description: "Material de construção", transactionValue: 3213.76,
                transactionDate: Date(),
                accountingTransaction: .debit
            ),
            FinancialTransaction(
                id: UUID.init().uuidString,
                description: "Marmita e CIA", transactionValue: 36.00,
                transactionDate: Date(),
                accountingTransaction: .debit
            ),
            FinancialTransaction(
                id: UUID.init().uuidString,
                description: "Padaria", transactionValue: 17.47,
                transactionDate: Date(),
                accountingTransaction: .debit
            )
        ]
    }
    
    
}
