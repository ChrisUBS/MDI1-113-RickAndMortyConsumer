//
//  CharacterTileView.swift
//  MDI1-113-RickAndMortyConsumer
//
//  Created by Christian Bonilla on 06/12/25.
//

import SwiftUI

struct CharacterTileView: View {
    let character: RMCharacter
    
    var body: some View {
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
