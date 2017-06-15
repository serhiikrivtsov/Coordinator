//
//  UsingNavigationProducerCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class UsingNavigationProducerCoordinator: Coordinator<UIViewController, UsingNavigationProducerViewController> {
    
    // MARK: - Child coordinators
    lazy var reusedCoordinator: ReusedCoordinator = {
        let coordinator = ReusedCoordinator()
        coordinator.navigationHandler = self.handleReusedCoordinatorNavigation
        return coordinator
    }()
    
    // MARK: - Coordinator overrides
    override func instantiateController() -> UsingNavigationProducerViewController {
        let controller = UsingNavigationProducerViewController()
        controller.navigationHandler = handleUsingNavigationProducerViewControllerNavigation
        return controller
    }
    
    override func coordinate(root: UIViewController, controller: UsingNavigationProducerViewController) {
        root.present(controller, animated: true)
    }
}

// MARK: - Navigation handlers
private extension UsingNavigationProducerCoordinator {
    
    func handleUsingNavigationProducerViewControllerNavigation(_ action: UsingNavigationProducerViewController.NavigationAction) {
        guard let controller = controller else { return }
        
        switch action {
        case .selectPresentReused:
            reusedCoordinator.startWith(root: controller) {
                $0.viewModel = ReusedViewModel(dismissButtonTitle: "Back to Main")
            }
        case .selectDismiss:
            controller.dismiss(animated: true)
        }
    }
    
    func handleReusedCoordinatorNavigation(_ action: ReusedCoordinator.Action) {
        switch action {
        case .selectDismiss:
            controller?.dismiss(animated: true)
        }
    }
}
