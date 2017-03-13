//
//  ViewController.swift
//  Example
//
//  Created by Serhii Krivtsov on 3/13/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class ViewController: UIViewController, NavigationProducer {
    
    // MARK: - NavigationProducer

    enum NavigationAction {
        case enter
    }
    
    typealias Action = NavigationAction
    
    var navigationHandler: ((ViewController.NavigationAction) -> Void)?
}

private extension ViewController { // MARK: IBActions
    
    @IBAction func enterButtonAction(_ sender: UIButton) {
        did(.enter)
    }
}
