//
//  CharacterDetailsView.swift
//  MDI1-113-RickAndMortyConsumer
//
//  Created by Christian Bonilla on 06/12/25.
//

import SwiftUI

struct CharacterDetailsView: View {
    @AppStorage("favorites") private var favoritesData: String = "[]"

    let character: RMCharacter
    
    var favorites: Set<Int> {
        get {
            let ids = (try? JSONDecoder().decode([Int].self, from: Data(favoritesData.utf8))) ?? []
            return Set(ids)
        }
        set {
            let array = Array(newValue)
            if let data = try? JSONEncoder().encode(array),
               let string = String(data: data, encoding: .utf8) {
                favoritesData = string
            }
        }
    }
    
    var isFavorite: Bool {
        let decoded = (try? JSONDecoder().decode([Int].self, from: Data(favoritesData.utf8))) ?? []
        return decoded.contains(character.id)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                AsyncImage(url: URL(string: character.image)) { img in
                    img.resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } placeholder: {
                    ProgressView()
                }

                Text(character.name)
                    .font(.headline)

                Text("Species: \(character.species)")
                    .font(.caption)

                Text("Status: \(character.status)")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Button(isFavorite ? "Remove Favorite" : "Add Favorite") {
                    var current = (try? JSONDecoder().decode([Int].self, from: Data(favoritesData.utf8))) ?? []

                    if current.contains(character.id) {
                        current.removeAll { $0 == character.id }
                    } else {
                        current.append(character.id)
                    }

                    if let data = try? JSONEncoder().encode(current),
                       let string = String(data: data, encoding: .utf8) {
                        favoritesData = string      // <-- esto SÍ es permitido
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 12)
            }
            .padding(.top, 8)
        }
        .navigationTitle("Details")
    }
}
