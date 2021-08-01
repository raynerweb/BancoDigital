//
//  BancoDigitalTests.swift
//  BancoDigitalTests
//
//  Created by rayner on 15/07/21.
//

import XCTest
@testable import BancoDigital

import RxSwift

class BancoDigitalTests: XCTestCase {

    
    var expectationGoToHome: XCTestExpectation!
    var expectationBadPassword: XCTestExpectation!
    
    var viewModel: LoginViewModel!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        self.disposeBag = DisposeBag()
        
        self.expectationGoToHome = XCTestExpectation(description: "Deve navegar para a Home")
        self.expectationBadPassword = XCTestExpectation(description: "Deve negar login")
        
        self.viewModel = LoginViewModel(appCoordinator: self)
    }
    
    override func tearDown() {
        super.tearDown()
        self.expectationGoToHome = nil
        self.expectationBadPassword = nil
        self.disposeBag = nil
    }
    
    func testLoginSuccessful() {
        viewModel.login(login: Login(username: "rayner", password: "123456"))
        wait(for: [self.expectationGoToHome], timeout: 5)
    }
    
    func testLoginError() {
        viewModel.onError.subscribe { event in
            if let message = event.element {
                XCTAssertEqual(message, "usuario ou senha inválido")
                self.expectationBadPassword.fulfill()
            } else {
                XCTFail("Mensagem não esperada")
            }
        }.disposed(by: disposeBag)
        
        viewModel.login(login: Login(username: "", password: ""))
        
        wait(for: [self.expectationBadPassword], timeout: 5)
    }
    

}

extension BancoDigitalTests : LoginCoordinator {
    
    func navigateHomeScreen() {
        self.expectationGoToHome.fulfill()
    }
    
}
