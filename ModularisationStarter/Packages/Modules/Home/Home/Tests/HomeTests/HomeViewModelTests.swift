//
//  HomeViewModelTests.swift
//  ModularisationStarterTests
//
//  Created by Emre Havan on 14.02.24.
//

import AnalyticsInterface
import CommonModels
import XCTest
@testable import Home

final class HomeViewModelTests: XCTestCase {

    var homeService: HomeServiceTestMock!
    var analyticsTracker: AnalyticsEventTrackerMock!

    override func setUp() {
        super.setUp()
        homeService = .init()
        analyticsTracker = .init()
    }

    override func tearDown() {
        homeService = nil
        analyticsTracker = nil
        super.tearDown()
    }

    func test_songs_are_fetched_when_view_is_appeared_for_the_first_time() async {
        let expectation = XCTestExpectation()
        homeService.fetchSongsExpectation = expectation
        let sut = makeSUT { _ in
            // ignore song selection for this test case
        }

        sut.onAppear()

        await fulfillment(of: [expectation], timeout: 1.0)
    }

    func test_songs_are_not_fetched_again_when_view_is_appeared_again() async {
        let expectation = XCTestExpectation()
        homeService.fetchSongsExpectation = expectation
        let sut = makeSUT { _ in
            // ignore song selection for this test case
        }

        sut.onAppear()

        await fulfillment(of: [expectation], timeout: 1.0)

        let expectationForSecondTime = XCTestExpectation()
        expectationForSecondTime.isInverted = true
        homeService.fetchSongsExpectation = expectation
        sut.onAppear()

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
        XCTAssertEqual(trackedEvent.name, HomeEventNames.songTappedFromHome)
    }

    // MARK: - Utilities
    private func makeSUT(onSongSelected: @escaping (Song) -> Void) -> HomeViewModel {
        .init(homeService: homeService, analyticsTracker: analyticsTracker, onSongSelected: onSongSelected)
    }

    private func makeSong() -> Song {
        .init(id: "1", name: "test", artistName: "test", artistIdentifier: "1", lyrics: "test")
    }
}
