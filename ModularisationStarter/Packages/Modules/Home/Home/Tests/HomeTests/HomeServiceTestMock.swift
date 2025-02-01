//
//  HomeServiceTestMock.swift
//  ModularisationStarterTests
//
//  Created by Emre Havan on 14.02.24.
//

import CommonModels
import Foundation
import XCTest
@testable import Home

final class HomeServiceTestMock: HomeServing {

    var fetchSongsExpectation: XCTestExpectation?

    func fetchSongs() async -> [Song] {
        fetchSongsExpectation?.fulfill()
        return [.init(id: "1", name: "test", artistName: "test", artistIdentifier: "1", lyrics: "test")]
    }
}
