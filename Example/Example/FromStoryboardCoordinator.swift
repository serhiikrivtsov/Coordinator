//
//  FromStoryboardCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class FromStoryboardCoordinator: Coordinator<UINavigationController, UIViewController> {
    
    // MARK: - Coordinator overrides
    override func instantiateController() -> UIViewController {
        return UIStoryboard(name: "FromStoryboard", bundle: nil).instantiateViewController(withIdentifier: "FromStoryboard")
    }
    
    override func coordinate(root: UINavigationController, controller: UIViewController) {
        root.show(controller, sender: nil)
    }
}
