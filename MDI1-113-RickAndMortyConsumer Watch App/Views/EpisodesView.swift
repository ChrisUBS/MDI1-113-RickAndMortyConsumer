//
//  EpisodesView.swift
//  MDI1-113-RickAndMortyConsumer
//
//  Created by Christian Bonilla on 06/12/25.
//

import SwiftUI

struct EpisodesView: View {
    @State private var episodes: [RMEpisode] = []
    @State private var loading = true
    
    var body: some View {
        Group {
            if loading {
                ProgressView("Loading Episodes...")
            } else {
                List(episodes) { ep in
                    VStack(alignment: .leading) {
                        Text(ep.name)
                            .font(.headline)
                        Text(ep.air_date)
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .task {
            do {
                episodes = try await RMWebService.fetchEpisodes()
            } catch {
                print(error.localizedDescription)
            }
            loading = false
        }
    }
}
