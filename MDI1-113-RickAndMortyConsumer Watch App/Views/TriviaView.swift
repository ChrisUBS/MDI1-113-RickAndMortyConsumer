//
//  TriviaView.swift
//  MDI1-113-RickAndMortyConsumer
//
//  Created by Christian Bonilla on 06/12/25.
//

import SwiftUI

struct TriviaView: View {
    var body: some View {
        Text(RMTrivia.random())
            .font(.headline)
            .padding()
    }
}
