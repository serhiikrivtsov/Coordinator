//
//  MainCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 3/13/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class MainCoordinator: Coordinator<UIViewController, MainViewController> {
    
    // MARK: - Coordinator overrides
    
    override func instantiateController() -> MainViewController {
        let controller = MainViewController()
//        controller.navigationHandler = viewControllerNavigationHandler
        return controller
    }
    
    override func coordinate(root: UIViewController, controller: MainViewController) {
        root.present(controller, animated: true)
    }
}
