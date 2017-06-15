//
//  LoginViewController.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class LoginViewController: UIViewController, NavigationProducer {

    // MARK: - NavigationProducer
    enum NavigationAction {
        case login
    }
    
    var navigationHandler: ((NavigationAction) -> Void)?
}

private extension LoginViewController {
    @IBAction func loginAction(_ sender: UIButton) {
        did(.login)
    }
}
