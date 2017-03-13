//
//  NavigationProducer.swift
//  Coordinator
//
//  Created by Serhii Krivtsov on 3/12/17.
//  Copyright © 2017 Serhii Krivtsov. All rights reserved.
//

public protocol NavigationProducer {
    associatedtype Action
    typealias Callback = (Action) -> Void
    
    var navigationHandler: Callback? { get set }
}

public extension NavigationProducer {
    func did(_ action: Action) {
        navigationHandler?(action)
    }
}
