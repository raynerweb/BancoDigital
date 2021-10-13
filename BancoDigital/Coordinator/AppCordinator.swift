import Foundation
import UIKit
import RxSwift

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    private let disposeBag = DisposeBag()
    private var window = UIWindow(frame: UIScreen.main.bounds)
    
    var navigationController = UINavigationController()
    var tabBarController = UITabBarController()
    
    func start() {
        self.navigationController.navigationBar.isHidden = true

        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
        
        // TODO: here you could check if user is signed in and show appropriate screen
        self.showSignIn()
    }
    
    func showSignIn() {
        let viewModel = LoginViewModel(appCoordinator: self)
        let loginViewController = LoginViewController(viewModel)
        
        
        // Coordinator initializes and injects viewModel
//        let signInViewModel = SignInViewModel(authentication: SessionService())
//        signInViewController.viewModel = signInViewModel
        
        // Coordinator subscribes to events and decides when and how to navigate
//        signInViewModel.didSignIn
//            .subscribe(onNext: { [weak signInViewController] in
//                // Navigate to dashboard
//                signInViewController?.showAlert(title: "Success", message: "Signed in")
//            })
//            .disposed(by: self.disposeBag)
//
        self.navigationController.viewControllers = [loginViewController]
    }
    
}

extension AppCoordinator: SuccessfulTransferCoordinator {
    func newTransfer() {
        if let navigationController = self.tabBarController.selectedViewController as? UINavigationController {
            guard let transferViewController = navigationController.viewControllers.filter({ $0 is TransferViewController}).first as? TransferViewController else { return }
            navigationController.popToViewController(transferViewController, animated: true)
        }
    }
}

extension AppCoordinator: ValueTransferCoordinator {
    func showSuccessful() {
        if let navigationController = self.tabBarController.selectedViewController as? UINavigationController {
            let viewModel = SuccessfulTransferViewModel(coordinator: self)
            let viewController = SuccessfulTransferViewController(viewModel: viewModel)
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}

extension AppCoordinator: BankCoordinator {
    
    func selectBank(bank: Bank) {
        if let transferNavigationController = self.tabBarController.selectedViewController as? UINavigationController {
            guard let transferViewController = transferNavigationController.viewControllers.filter({ $0 is TransferViewController}).first as? TransferViewController else { return }
            transferViewController.viewModel.selectBank(bank: bank)
            transferNavigationController.popToViewController(transferViewController, animated: true)
        }
    }
    
    func showValueTransfer() {
        if let navigationController = self.tabBarController.selectedViewController as? UINavigationController {
            let viewModel = ValueTransferViewModel(coordinator: self)
            let viewController = ValueTransferViewController(viewModel: viewModel)
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
}

extension AppCoordinator: TransferCoordinator {
    func showBankList() {
        if let navigationController = self.tabBarController.selectedViewController as? UINavigationController {
            let bankViewModel = BankViewModel(bankCoordinator: self)
            let bankViewController = BankViewController(viewModel: bankViewModel)
            navigationController.pushViewController(bankViewController, animated: true)
        }
    }
}

extension AppCoordinator: LoginCoordinator {
    func navigateHomeScreen() {
        
        let welcomeViewController = welcomeViewController()
        let welcomeTabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "icons8-home"), tag: 0)
        welcomeViewController.tabBarItem = welcomeTabBarItem
        
        let statementViewController = statementViewController()
        
//        let paymentViewController = welcomeViewController
//        let paymentTabBarItem = UITabBarItem(title: "Pagar", image: UIImage(named: "icons8-barcode"), tag: 1)
//        paymentViewController.tabBarItem = paymentTabBarItem
        
        let transferNavigation = transferNavigation()
        
//        let helpViewController = welcomeViewController
//        let helpTabBarItem = UITabBarItem(title: "Ajuda", image: UIImage(named: "icons8-filled_chat"), tag: 1)
//        helpViewController.tabBarItem = helpTabBarItem
    
        
//        let navigation = UINavigationController()
//        tabBarController.viewControllers = [welcomeViewController, statementViewController, paymentViewController, transferNavigation, helpViewController]
        
        tabBarController.viewControllers = [welcomeViewController, statementViewController, transferNavigation]
        
        tabBarController.modalPresentationStyle = .fullScreen
        
        self.navigationController.present(tabBarController, animated: true, completion: nil)
    }
    
    private func welcomeViewController() -> UIViewController {
        let viewModel = WelcomeViewModel()
        return WelcomeViewController(viewModel)
    }
    
    private func statementViewController() -> UIViewController {
        let statementViewModel = StatementViewModel()
        let statementViewController = StatementViewController(statementViewModel)
        let statementTabBarItem = UITabBarItem(title: "Extrato", image: UIImage(named: "icons8-wallet_copy_2"), tag: 1)
        statementViewController.tabBarItem = statementTabBarItem
        return statementViewController
    }
    
    private func transferNavigation() -> UINavigationController {
        let transferViewModel = TransferViewModel(appCoordinator: self)
        let transferViewController = TransferViewController(viewModel: transferViewModel)
        let transferTabBarItem = UITabBarItem(title: "Transferir", image: UIImage(named: "icons8-data_in_both_directions"), tag: 1)
        transferViewController.tabBarItem = transferTabBarItem
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [transferViewController]
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }
}

