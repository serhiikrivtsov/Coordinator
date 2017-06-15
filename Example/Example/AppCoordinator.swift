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
    lazy var mainTableViewCoordinator = MainTableViewCoordinator()
    
    // MARK: - Coordinator overrides
    override func instantiateController() -> UIViewController {
        return UIViewController()
    }
    
    override func coordinate(root: UIWindow, controller: UIViewController) {
        root.rootViewController = controller
        
        mainTableViewCoordinator.startWith(root: controller)
    }
}
