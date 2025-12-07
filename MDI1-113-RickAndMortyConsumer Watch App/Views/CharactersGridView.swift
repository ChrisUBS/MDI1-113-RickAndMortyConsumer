//
//  CharactersGridView.swift
//  MDI1-113-RickAndMortyConsumer
//
//  Created by Christian Bonilla on 02/12/25.
//

import SwiftUI

struct CharactersGridView: View {
    @EnvironmentObject private var store: RMCharactersStore
    
    // Defining Number of Columns For Grid
    private let columns = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
    ]
    
    var body: some View {
        Group {
            if store.isInitialLoading && store.characters.isEmpty {
                VStack(spacing: 8) {
                    ProgressView()
                    Text("Loading...")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            } else if let message = store.errorMessage, store.characters.isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundStyle(.yellow)
                    Text(message)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 6) {
                        ForEach(store.characters.indices, id: \.self) { idx in
                            let character = store.characters[idx]
                            
                            NavigationLink {
                                CharacterDetailsView()
                            } label: {
                                CharacterTileView(character: character)
                            }
                            .buttonStyle(.plain)
                            .task { await store.loadMoreIfNeeded(idx: idx) }
                        }
                    }
                }
            }
        }
    }
}
