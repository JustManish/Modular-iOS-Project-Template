//
//  SongDetailsCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import ArtistDetailInterface
import AnalyticsInterface
import CommonModels
import DependencyContainer
import SwiftUI

final class SongDetailsCoordinator {

    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func makeViewController(with song: Song) -> UIViewController {
        let analyticsTracker = DC.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
        let view = SongDetailsView(
            viewModel: .init(
                song: song,
                analyticsTracker: analyticsTracker,
                onGoToArtistTapped: pushArtistDetail(withIdentifier:)
            )
        )
        let hostingVC = UIHostingController(rootView: view)
        hostingVC.title = song.name
        return hostingVC
    }

    private func pushArtistDetail(withIdentifier id: String) {
        let gateway = DC.shared.resolve(type: .closureBased, for: ArtistDetailInterface.self)
        let view = gateway.makeArtistDetailModule(
            navigationController: navigationController,
            artistIdentifier: id
        )
        navigationController?.pushViewController(view, animated: true)
    }
}
