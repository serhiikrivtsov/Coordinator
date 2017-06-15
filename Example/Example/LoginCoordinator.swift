//
//  LoginCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class LoginCoordinator: Coordinator<UIViewController, LoginViewController>, NavigationProducer {
    
    // MARK: - Coordinator overrides
    override func instantiateController() -> LoginViewController {
        let controller = LoginViewController()
        controller.navigationHandler = handleLoginCoordinatorNavigation
        return controller
    }
    
    override func coordinate(root: UIViewController, controller: LoginViewController) {
        root.present(controller, animated: true)
    }
    
    // MARK: - NavigationProducer
    var navigationHandler: ((LoginViewController.Action) -> Void)?
}

// MARK: - Navigation handlers
private extension LoginCoordinator {
    func handleLoginCoordinatorNavigation(_ action: LoginCoordinator.Action) {
        controller?.dismiss(animated: true) {
            self.did(action)
        }
    }
}
