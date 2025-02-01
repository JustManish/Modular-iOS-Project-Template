//
//  HomeService.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import CommonModels
import Foundation

protocol HomeServing {
    func fetchSongs() async -> [Song]
}

struct HomeServicePreviewMock: HomeServing {

    func fetchSongs() async -> [Song] {
        return [
            .init(id: "1", name: "test", artistName: "test name", artistIdentifier: "1", lyrics: "Test Lyrics")
        ]
    }
}

struct HomeService: HomeServing {
    func fetchSongs() async -> [Song] {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return [
            Song(
                id: "1",
                name: "Lose You",
                artistName: "Sam Smith",
                artistIdentifier: "1",
                lyrics: "Baby, I'm not ready to lose you yet Yeah, I've tried but you know I can't forget I'm begging you I'm not ready to lose you"
            ),
            Song(
                id: "2",
                name: "Fire On Fire",
                artistName: "Sam Smith",
                artistIdentifier: "1",
                lyrics: "Fire on fire would normally kill us But this much desire, together, we're winners They say that we're out of control and some say we're sinners But don't let them ruin our beautiful rhythms Cause when you unfold me and tell me you love me And look in my eyes You are perfection, my only direction It's fire on fire, mmm It's fire on fire"
            ),
            Song(
                id: "3",
                name: "Easy On Me",
                artistName: "Adele",
                artistIdentifier: "2",
                lyrics: "Go easy on me, baby I was still a child Didn't get the chance to Feel the world around me I had no time to choose What I chose to do So go easy on me"
            ),
            Song(
                id: "4",
                name: "Someone Like You",
                artistName: "Adele",
                artistIdentifier: "2",
                lyrics: "Never mind, I'll find someone like you I wish nothing but the best for you, too Don't forget me, I beg I remember you said Sometimes it lasts in love, but sometimes it hurts instead Sometimes it lasts in love, but sometimes it hurts instead"
            ),
        ]
    }
}
