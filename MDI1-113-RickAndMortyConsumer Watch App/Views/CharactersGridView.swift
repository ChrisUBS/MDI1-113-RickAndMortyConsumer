//
//  CharactersGridView.swift
//  MDI1-113-RickAndMortyConsumer
//
//  Created by Christian Bonilla on 02/12/25.
//

import SwiftUI

struct CharactersGridView: View {
    private let mockCharacters: [RMCharacter] = [
        RMCharacter(name: "Rick Sanchez", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
        RMCharacter(name: "Rick Sanchez", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
        RMCharacter(name: "Rick Sanchez", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
        RMCharacter(name: "Rick Sanchez", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
    ]
    
    // Defining Number of Columns For Grid
    private let columns = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 6) {
                ForEach(mockCharacters) { character in
                    VStack(spacing: 2) {
                        AsyncImage(url: URL(string: character.image)) { phase in
                            switch phase {
                            case .success (let image):
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            case .empty:
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.secondary.opacity(0.4))
                                    ProgressView()
                                }
                                .frame(width: 70, height: 70)
                            case .failure:
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.secondary.opacity(0.4))
                                Image(systemName: "photo")
                                        .font(.title3)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        Text(character.name)
                            .font(.caption)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
        }
    }
}

#Preview {
    CharactersGridView()
}
