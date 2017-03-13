//
//  Coordinator.swift
//  Coordinator
//
//  Created by Serhii Krivtsov on 3/12/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit

public protocol CoordinatorsRoot: class {}
extension UIWindow: CoordinatorsRoot {}
extension UIViewController: CoordinatorsRoot {}

open class Coordinator<Root: CoordinatorsRoot, Controller: UIViewController> {
    
    weak public private(set) var root: Root?
    weak public private(set) var controller: Controller?
    
    public init() {}
    
    public final func startWith(root: Root, controllerConfiguration: ((_ controller: Controller) -> Void)? = nil) {
        self.root = root
        
        let controller = instantiateController()
        self.controller = controller
        controllerConfiguration?(controller)
        
        self.coordinate(root: root, controller: controller)
    }
    
    open func coordinate(root: Root, controller: Controller) {
        preconditionFailure("This method must be overridden")
    }
    
    open func instantiateController() -> Controller {
        preconditionFailure("This method must be overridden")
    }
}
