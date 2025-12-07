//
//  Models.swift
//  MDI1-113-RickAndMortyConsumer
//
//  Created by Christian Bonilla on 02/12/25.
//
import SwiftUI

struct RMCharactersResponse: Decodable {
    let results: [RMCharacter]
    let info: RMInfoResponse
    
    struct RMInfoResponse: Decodable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
}

struct RMCharacter: Identifiable, Decodable {
    let id: Int
    let name: String
    let image: String
    let species: String
    let status: String
}

struct RMEpisodeResponse: Decodable {
    let results: [RMEpisode]
}

struct RMEpisode: Identifiable, Decodable {
    let id: Int
    let name: String
    let air_date: String
}

struct RMTrivia {
    static let randomQuotes = [
        "Wubba Lubba Dub Dub!",
        "I'm Pickle Rick!",
        "Sometimes science is more art than science."
    ]
    
    static func random() -> String {
        randomQuotes.randomElement()!
    }
}

