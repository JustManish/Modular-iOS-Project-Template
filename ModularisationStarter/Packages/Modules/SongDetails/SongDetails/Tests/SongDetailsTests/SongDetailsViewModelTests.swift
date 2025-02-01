//
//  SongDetailsViewModelTests.swift
//  ModularisationStarterTests
//
//  Created by Emre Havan on 14.02.24.
//

import AnalyticsInterface
import CommonModels
import XCTest
@testable import SongDetails

final class SongDetailsViewModelTests: XCTestCase {

    var analyticsTracker: AnalyticsEventTrackerMock!

    override func setUp() {
        super.setUp()
        analyticsTracker = .init()
    }

    override func tearDown() {
        analyticsTracker = nil
        super.tearDown()
    }

    func test_correct_properties_are_provided_for_ui() {
        let sut = makeSUT { _ in
            // ignore artist selection for this test case
        }

        XCTAssertEqual(sut.name(), "test_song")
        XCTAssertEqual(sut.artistName(), "test_artist")
        XCTAssertEqual(sut.lyrics(), "test_lyrics")
    }

    func test_user_is_navigated_when_artist_info_is_tapped() {
        let expectation = XCTestExpectation()
        let sut = makeSUT { _ in
            expectation.fulfill()
        }

        sut.didTapGoToArtist()

        wait(for: [expectation], timeout: 1.0)
    }

    func test_going_to_artist_page_is_tracked() throws {
        let sut = makeSUT { _ in
            // ignore artist selection for this test case
        }

        sut.didTapGoToArtist()

        XCTAssertEqual(1, analyticsTracker.trackedEvents.count)
        let trackedEvent = try XCTUnwrap(analyticsTracker.trackedEvents.first)
        XCTAssertEqual(trackedEvent.name, SongDetailsEventNames.artistTappedFromSongDetail)
    }

    // MARK: - Utilities

    private func makeSUT(onGoToArtistTapped: @escaping (String) -> Void) -> SongDetailsViewModel {
        .init(song: makeSong(), analyticsTracker: analyticsTracker, onGoToArtistTapped: onGoToArtistTapped)
    }

    private func makeSong() -> Song {
        Song(id: "1", name: "test_song", artistName: "test_artist", artistIdentifier: "1", lyrics: "test_lyrics")
    }
}
