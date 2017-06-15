//
//  UsingNavigationDelegateViewController.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit

protocol NavigationDelegate: class {
    func viewControllerDidPresentReused(_ controller: UsingNavigationDelegateViewController)
    func viewControllerDidDismiss(_ controller: UsingNavigationDelegateViewController)
}

class UsingNavigationDelegateViewController: UIViewController {
    weak var navigationDelegate: NavigationDelegate?
}

// MARK: - IBActions
private extension UsingNavigationDelegateViewController {
    @IBAction func presentReusedAction(_ sender: UIButton) {
        navigationDelegate?.viewControllerDidPresentReused(self)
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        navigationDelegate?.viewControllerDidDismiss(self)
    }
}
