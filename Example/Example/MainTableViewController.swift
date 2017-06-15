//
//  MainTableViewController.swift
//  Example
//
//  Created by Serhii Krivtsov on 6/15/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

import UIKit
import Coordinator

class MainTableViewController: UITableViewController, NavigationProducer {
    
    // MARK: - NavigationProducer
    enum NavigationAction {
        case selectFromXib
        case selectFromStoryboard
        case selectUsingNavigationProducer
        case selectUsingNavigationDelegate
    }
        
    var navigationHandler: ((NavigationAction) -> Void)?
    
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            did(.selectFromXib)
        case (0, 1):
            did(.selectFromStoryboard)
        case (1, 0):
            did(.selectUsingNavigationProducer)
        case (1, 1):
            did(.selectUsingNavigationDelegate)
        default:
            break
        }
    }
}
