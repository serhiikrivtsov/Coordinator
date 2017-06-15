//
//  ReusedCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class ReusedCoordinator: Coordinator<UIViewController, ReusedViewController>, NavigationProducer {
    
    // MARK: - Coordinator overrides
    override func instantiateController() -> ReusedViewController {
        let controller = ReusedViewController()
        controller.navigationHandler = handleReusedViewControllerNavigation
        return controller
    }
    
    override func coordinate(root: UIViewController, controller: ReusedViewController) {
        root.present(controller, animated: true)
    }
    
    // MARK: - NavigationProducer
    var navigationHandler: ((ReusedViewController.Action) -> Void)?
}

// MARK: - Navigation handlers
private extension ReusedCoordinator {
    
    func handleReusedViewControllerNavigation(_ action: ReusedViewController.Action) {
        controller?.dismiss(animated: true) { self.did(action) }
    }
}
