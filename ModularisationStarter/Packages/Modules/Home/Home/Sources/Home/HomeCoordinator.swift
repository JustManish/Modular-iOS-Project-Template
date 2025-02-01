//
//  HomeCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import AnalyticsInterface
import CommonModels
import DependencyContainer
import SongDetailsInterface
import SwiftUI

final class HomeCoordinator {

    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }()

    func makeViewController() -> UIViewController {
        let analyticsTracker = DC.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
        let viewModel = HomeViewModel(homeService: HomeService(), analyticsTracker: analyticsTracker, onSongSelected: pushSongDetail(_:))
        let homeView = HomeView(viewModel: viewModel)
        let hostingVC = UIHostingController(rootView: homeView)
        navigationController.setViewControllers([hostingVC], animated: false)
        return navigationController
    }

    func pushSongDetail(_ song: Song) {
        let gateway = DC.shared.resolve(type: .closureBased, for: SongDetailsInterface.self)
        let songDetailView = gateway.makeSongDetailsModule(navigationController: navigationController, song: song)
        navigationController.pushViewController(songDetailView, animated: true)
    }
}
