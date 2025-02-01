//
//  ArtistServiceTestMock.swift
//  ModularisationStarterTests
//
//  Created by Emre Havan on 14.02.24.
//

import XCTest
@testable import ArtistDetail

final class ArtistServiceTestMock: ArtistServing {

    var fetchArtistExpectation: XCTestExpectation?

    func fetchArtist(withIdentifier id: String) async -> Artist {
        fetchArtistExpectation?.fulfill()
        let birthDate = Date(timeIntervalSince1970: 0)
        return .init(name: "test", birthDate: birthDate, songs: [.init(id: "1", name: "test", artistName: "test", artistIdentifier: "1", lyrics: "test")])
    }
}
