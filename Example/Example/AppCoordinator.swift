//
//  AppCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 3/13/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import Coordinator

class AppCoordinator: Coordinator<UIWindow, UIViewController> {
    
    // MARK: - Child coordinators
    lazy var loginCoordinator: LoginCoordinator = {
        let coordinator = LoginCoordinator()
        coordinator.navigationHandler = self.handleLoginCoordinatorNavigation
        return coordinator
    }()
    
    lazy var mainTableViewCoordinator: MainTableViewCoordinator = {
        let coordinator = MainTableViewCoordinator()
        coordinator.navigationHandler = self.handleMainTableViewCoordinatorNavigation
        return coordinator
    }()
    
    // MARK: - Coordinator overrides
    override func instantiateController() -> UIViewController {
        return UIViewController()
    }
    
    override func coordinate(root: UIWindow, controller: UIViewController) {
        root.rootViewController = controller
        
        loginCoordinator.startWith(root: controller)
    }
}

// MARK: - Navigation handlers
private extension AppCoordinator {
    func handleLoginCoordinatorNavigation(_ action: LoginCoordinator.Action) {
        guard let controller = root?.rootViewController else { return }
        
        switch action {
        case .login:
            mainTableViewCoordinator.startWith(root: controller)
        }
    }
    
    func handleMainTableViewCoordinatorNavigation(_ action: MainTableViewCoordinator.Action) {
        guard let controller = root?.rootViewController else { return }
        
        switch action {
        case .logout:
            loginCoordinator.startWith(root: controller)
        }
    }
}
