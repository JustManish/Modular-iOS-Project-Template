//
//  SongDetailsGateway.swift
//
//
//  Created by Emre Havan on 06.03.24.
//

import CommonModels
import SongDetailsInterface
import UIKit

public struct SongDetailsGateway: SongDetailsInterface {
    
    public init() { }

    public func makeSongDetailsModule(
        navigationController: UINavigationController?,
        song: Song
    ) -> UIViewController {
        let coordinator = SongDetailsCoordinator(navigationController: navigationController)
        return coordinator.makeViewController(with: song)
    }
}

