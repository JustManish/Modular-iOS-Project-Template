//
//  ArtistDetailsView.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import AnalyticsInterface
import Localisation
import SwiftUI

struct ArtistDetailsView: View {

    @ObservedObject var viewModel: ArtistDetailsViewModel
    var body: some View {
        VStack {
            if let artist = viewModel.artist {
                VStack(alignment: .leading, spacing: 16.0) {
                    Text(artist.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    HStack {
                        Text("ms_artist_details_birth_date".localisedCommon)
                            .font(.headline)
                        Text(viewModel.birthDateFormatted())
                            .font(.subheadline)
                    }
                    .padding(.horizontal)
                    List {
                        Section {
                            ForEach(artist.songs, id: \.self) { song in
                                Text(song.name)
                                    .onTapGesture {
                                        viewModel.didSelectSong(song)
                                    }
                            }
                        } header: {
                            Text("ms_artist_details_songs_header".localisedCommon)
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    ArtistDetailsView(
        viewModel: .init(
            artistService: ArtistServiceMock(),
            analyticsTracker: AnalyticsEventTrackerMock(),
            artistIdentifier: "1",
            onSongSelected: { _ in }
        )
    )
}
