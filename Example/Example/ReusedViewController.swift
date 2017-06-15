//
//  ReusedViewController.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class ReusedViewController: UIViewController, NavigationProducer {
    
    var viewModel: ReusedViewModel!
    
    @IBOutlet private weak var dismissButton: UIButton!
    
    //MARK: - UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissButton.setTitle(viewModel.dismissButtonTitle, for: .normal)
    }
    
    // MARK: - NavigationProducer
    enum NavigationAction {
        case selectDismiss
    }
    
    var navigationHandler: ((NavigationAction) -> Void)?
}

//MARK: - IBActions
extension ReusedViewController {
    @IBAction func dismissAction(_ sender: UIButton) {
        did(.selectDismiss)
    }
}
