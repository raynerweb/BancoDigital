//
//  LoginViewController.swift
//  BancoDigital
//
//  Created by rayner on 15/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    let viewModel: LoginViewModel
    let disposeBag = DisposeBag()
    
    init(_ viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "LoginViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupViews()
        subscribe()
        
    }

    @IBAction func loginButton(_ sender: Any) {
        let login = Login(username: self.username.text ?? "", password: self.password.text ?? "")
        viewModel.login(login: login)
    }
    
    private func setupViews() {
        self.password.rx.text.orEmpty.map { String($0.prefix(6)) }
            .bind(to: self.password.rx.text)
            .disposed(by: disposeBag)
        
    }
    
    private func subscribe() {
        
        viewModel.onSuccess.subscribe { event in
            if let user = event.element {
                print(user)
            }
        }.disposed(by: disposeBag)
        
        
        viewModel.loading.bind(to: self.loading.rx.isAnimating).disposed(by: disposeBag)
    }

}
