//
//  UsingNavigationDelegateCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class UsingNavigationDelegateCoordinator: Coordinator<UIViewController, UsingNavigationDelegateViewController> {
    
    // MARK: - Child coordinators
    lazy var reusedCoordinator = ReusedCoordinator()
    
    // MARK: - Coordinator overrides
    override func instantiateController() -> UsingNavigationDelegateViewController {
        let controller = UsingNavigationDelegateViewController()
        controller.navigationDelegate = self
        return controller
    }
    
    override func coordinate(root: UIViewController, controller: UsingNavigationDelegateViewController) {
        root.present(controller, animated: true)
    }
}

//MARK: - NavigationDelegate
extension UsingNavigationDelegateCoordinator: NavigationDelegate {
    func viewControllerDidPresentReused(_ controller: UsingNavigationDelegateViewController) {
        reusedCoordinator.startWith(root: controller) {
            $0.viewModel = ReusedViewModel(dismissButtonTitle: "Back to UsingNavigationDelegate")
        }
    }
    
    func viewControllerDidDismiss(_ controller: UsingNavigationDelegateViewController) {
        controller.dismiss(animated: true)
    }
}
