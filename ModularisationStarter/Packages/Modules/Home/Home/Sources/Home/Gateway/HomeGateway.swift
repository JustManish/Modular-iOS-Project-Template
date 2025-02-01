//
//  HomeGateway.swift
//
//
//  Created by Emre Havan on 06.03.24.
//

import UIKit

public struct HomeGateway {

    public init() {
        
    }

    public func makeHomeModule() -> UIViewController {
        let coordinator = HomeCoordinator()
        return coordinator.makeViewController()
    }
}
