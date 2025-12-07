//
//  MDI1_113_RickAndMortyConsumerApp.swift
//  MDI1-113-RickAndMortyConsumer Watch App
//
//  Created by Christian Bonilla on 02/12/25.
//

import SwiftUI

@main
struct MDI1_113_RickAndMortyConsumer_Watch_AppApp: App {
    @StateObject private var store = RMCharactersStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environmentObject(store)
            .task {
                await store.initialLoad()
            }
        }
    }
}
