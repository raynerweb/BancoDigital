//
//  LoginViewModel.swift
//  BancoDigital
//
//  Created by rayner on 15/07/21.
//

import Foundation
import RxSwift

protocol LoginCoordinator: AnyObject {
    func navigateHomeScreen()
}

class LoginViewModel {
    
    let appCoordinator: LoginCoordinator
    let onSuccess = BehaviorSubject<User?>(value: nil)
    let onError = PublishSubject<String>()
    
    let loading = BehaviorSubject<Bool>(value: false)

    
    init(appCoordinator: LoginCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    func login(login: Login) {
        self.loading.onNext(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            self.loading.onNext(false)
            if (login.password == "123456") {
                self.appCoordinator.navigateHomeScreen()
            } else {
                self.onError.onNext("usuario ou senha inválido")
            }
            
        }
        
        
        
        onSuccess.onNext(User(username: "rayner", name: "Ráyner Carvalho Lima"))
       
        
    }
    
    
    
}
