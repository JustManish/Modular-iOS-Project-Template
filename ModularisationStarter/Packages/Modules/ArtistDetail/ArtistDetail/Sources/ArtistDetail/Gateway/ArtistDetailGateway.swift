//
//  ArtistDetailGateway.swift
//
//
//  Created by Emre Havan on 05.03.24.
//

import ArtistDetailInterface
import UIKit

public struct ArtistDetailGateway: ArtistDetailInterface {
    
    public init() {
        
    }

    public func makeArtistDetailModule(
        navigationController: UINavigationController?,
        artistIdentifier: String
    ) -> UIViewController {
        let coordinator = ArtistDetailsCoordinator(navigationController: navigationController)
        return coordinator.makeViewController(artistIdentifier: artistIdentifier)
    }
}
