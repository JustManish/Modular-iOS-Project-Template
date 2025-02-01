//
//  HomeViewModel.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import AnalyticsInterface
import CommonModels
import SwiftUI

final class HomeViewModel: ObservableObject {

    @Published var songs = [Song]()

    private let homeService: HomeServing
    private let analyticsTracker: AnalyticsEventTracking
    private let onSongSelected: (Song) -> Void
    private var didCallOnAppearForTheFirstTime = false

    init(homeService: HomeServing, analyticsTracker: AnalyticsEventTracking, onSongSelected: @escaping (Song) -> Void) {
        self.homeService = homeService
        self.analyticsTracker = analyticsTracker
        self.onSongSelected = onSongSelected
    }

    func onAppear() {
        guard didCallOnAppearForTheFirstTime == false else {
            return
        }
        didCallOnAppearForTheFirstTime = true
        fetchSongs()
    }

    func didSelectSong(_ song: Song) {
        analyticsTracker.trackEvent(.init(name: HomeEventNames.songTappedFromHome))
        onSongSelected(song)
    }

    private func fetchSongs() {
        Task { @MainActor in
            self.songs = await homeService.fetchSongs()
        }
    }
}
