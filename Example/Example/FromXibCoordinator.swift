//
//  FromXibCoordinator.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class FromXibCoordinator: Coordinator<UINavigationController, FromXibViewController> {
    
    // MARK: - Coordinator overrides
    override func instantiateController() -> FromXibViewController {
        return FromXibViewController()
    }
    
    override func coordinate(root: UINavigationController, controller: FromXibViewController) {
        root.show(controller, sender: nil)
    }
}
