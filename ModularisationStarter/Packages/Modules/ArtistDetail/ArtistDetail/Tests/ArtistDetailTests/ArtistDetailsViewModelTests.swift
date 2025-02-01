//
//  ArtistDetailsViewModelTests.swift
//  ModularisationStarterTests
//
//  Created by Emre Havan on 14.02.24.
//

import AnalyticsInterface
import CommonModels
import XCTest
@testable import ArtistDetail

final class ArtistDetailsViewModelTests: XCTestCase {

    var analyticsTracker: AnalyticsEventTrackerMock!
    var artistService: ArtistServiceTestMock!

    override func setUp() {
        super.setUp()
        analyticsTracker = .init()
        artistService = .init()
    }

    override func tearDown() {
        analyticsTracker = nil
        artistService = nil
        super.tearDown()
    }

    func test_artist_details_are_fetched_when_view_is_appeared_for_the_first_time() async {
        let expectation = XCTestExpectation()
        artistService.fetchArtistExpectation = expectation
        let sut = makeSUT { _ in
            // ignore song selection for this test case
        }

        sut.onAppear()

        await fulfillment(of: [expectation], timeout: 1.0)
    }

    func test_artist_details_are_not_fetched_again_when_view_appears_again() async {
        // Given
        let expectation = XCTestExpectation()
        artistService.fetchArtistExpectation = expectation
        let sut = makeSUT { _ in
            // ignore song selection for this test case
        }

        sut.onAppear()

        await fulfillment(of: [expectation], timeout: 1.0)

        // When
        let expectationForSecondTime = XCTestExpectation()
        expectationForSecondTime.isInverted = true
        artistService.fetchArtistExpectation = expectationForSecondTime
        sut.onAppear()

        // Then
        await fulfillment(of: [expectationForSecondTime], timeout: 1.0)
    }

    func test_the_user_is_navigated_when_a_song_is_selected() {
        let expectation = XCTestExpectation()
        let sut = makeSUT { _ in
            expectation.fulfill()
        }

        sut.didSelectSong(makeSong())

        wait(for: [expectation], timeout: 1.0)
    }

    func test_song_selection_is_tracked() throws {
        let sut = makeSUT { _ in
            // ignore song selection for this test case
        }

        sut.didSelectSong(makeSong())

        XCTAssertEqual(1, analyticsTracker.trackedEvents.count)
        let trackedEvent = try XCTUnwrap(analyticsTracker.trackedEvents.first)
        XCTAssertEqual(trackedEvent.name, ArtistDetailsEventNames.songTappedFromArtistDetail)
    }

    // MARK: - Utilities
    private func makeSUT(onSongSelected: @escaping (Song) -> Void) -> ArtistDetailsViewModel {
        .init(artistService: artistService, analyticsTracker: analyticsTracker, artistIdentifier: "1", onSongSelected: onSongSelected)
    }

    private func makeSong() -> Song {
        .init(id: "1", name: "test_song", artistName: "test_artist", artistIdentifier: "1", lyrics: "test_lyrics")
    }
}
