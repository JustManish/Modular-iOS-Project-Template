//
//  RootCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import Home
import UIKit

final class RootCoordinator {

    func makeInitialView() -> UIViewController {
        let gateway = HomeGateway()
        let homeView = gateway.makeHomeModule()
        let tabBarController = RootTabBarController(viewControllers: [homeView])
        return tabBarController
    }
}
