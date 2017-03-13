//
//  AppCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 3/13/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import Coordinator

class AppCoordinator: Coordinator<UIWindow, ViewController> {
    
    // MARK: - Child coordinators
    
    lazy var mainCoordinator: MainCoordinator = {
        return MainCoordinator()
    }()
    
    // MARK: - Coordinator overrides
    
    override func instantiateController() -> ViewController {
        let controller = ViewController()
        controller.navigationHandler = viewControllerNavigationHandler
        return controller
    }
    
    override func coordinate(root: UIWindow, controller: ViewController) {
        root.rootViewController = controller
    }
}

private extension AppCoordinator { // MARK: Navigation Handlers
    
    func viewControllerNavigationHandler(_ action: ViewController.NavigationAction) {
        switch action {
        case .enter:
            mainCoordinator.startWith(root: controller!)
        }
    }
}
