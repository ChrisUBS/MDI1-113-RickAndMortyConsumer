//
//  ContentView.swift
//  MDI1-113-RickAndMortyConsumer Watch App
//
//  Created by Christian Bonilla on 02/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharactersGridView()
                .tabItem { Text("Characters") }
            
            EpisodesView()
                .tabItem { Text("Episodes") }
            
            TriviaView()
                .tabItem { Text("Trivia") }
        }
    }
}
