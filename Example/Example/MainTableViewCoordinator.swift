//
//  MainTableViewCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class MainTableViewCoordinator: Coordinator<UIViewController, MainTableViewController> {
    
    // MARK: - Child coordinators
    lazy var fromXibCoordinator = FromXibCoordinator()
    
    lazy var fromStoryboardCoordinator = FromStoryboardCoordinator()
    
    lazy var usingNavigationProducerCoordinator = UsingNavigationProducerCoordinator()
    
    lazy var usingNavigationDelegateCoordinator = UsingNavigationDelegateCoordinator()
    
    // MARK: - Coordinator overrides
    override func instantiateController() -> MainTableViewController {
        let storyboard = UIStoryboard(name: "MainTableViewStoryboard", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! MainTableViewController
        
        controller.navigationHandler = handleMainTableViewControllerNavigation
        return controller
    }
    
    override func coordinate(root: UIViewController, controller: MainTableViewController) {
        let navigationController = UINavigationController(rootViewController: controller)
        root.present(navigationController, animated: false)
    }
}

// MARK: - Navigation handlers
private extension MainTableViewCoordinator {
    
    func handleMainTableViewControllerNavigation(_ action: MainTableViewController.NavigationAction) {
        guard let navigationController = controller?.navigationController else { return }
        
        switch action {
        case .selectFromXib:
            fromXibCoordinator.startWith(root: navigationController)
        case .selectFromStoryboard:
            fromStoryboardCoordinator.startWith(root: navigationController)
        case .selectUsingNavigationProducer:
            usingNavigationProducerCoordinator.startWith(root: navigationController)
        case .selectUsingNavigationDelegate:
            usingNavigationDelegateCoordinator.startWith(root: navigationController)
        }
    }
}
