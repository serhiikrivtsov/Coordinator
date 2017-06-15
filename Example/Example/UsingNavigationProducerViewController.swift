//
//  UsingNavigationProducerViewController.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class UsingNavigationProducerViewController: UIViewController, NavigationProducer {

    // MARK: - NavigationProducer
    enum NavigationAction {
        case selectPresentReused
        case selectDismiss
    }
        
    var navigationHandler: ((NavigationAction) -> Void)?
}

// MARK: - IBActions
private extension UsingNavigationProducerViewController {
    @IBAction func presentReusedAction(_ sender: UIButton) {
        did(.selectPresentReused)
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        did(.selectDismiss)
    }
}
