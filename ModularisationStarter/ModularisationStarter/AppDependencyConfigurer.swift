//
//  AppDependencyConfigurer.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 04.03.24.
//

import ArtistDetail
import ArtistDetailInterface
import Analytics
import AnalyticsInterface
import DependencyContainer
import Foundation
import SongDetails
import SongDetailsInterface

enum AppDependencyConfigurer {
    static func configure() {
        // MARK: - Analytics Registration
        let analyticsTracker = AnalyticsEventTracker()
        DC.shared.register(type: .singleInstance(analyticsTracker), for: AnalyticsEventTracking.self)

        // MARK: - Artist Detail Registration
        let artistDetailClosure: () -> ArtistDetailInterface = {
            ArtistDetailGateway()
        }
        DC.shared.register(type: .closureBased(artistDetailClosure), for: ArtistDetailInterface.self)

        // MARK: - Song Details Registration
        let songDetailsClosure: () -> SongDetailsInterface = {
            SongDetailsGateway()
        }
        DC.shared.register(type: .closureBased(songDetailsClosure), for: SongDetailsInterface.self)
    }
}
