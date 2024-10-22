//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 22/10/24.
//

import SwiftUI

struct CharactersView: View {
    @EnvironmentObject private var coordinator: AppCoordinator

    var body: some View {
        List {
            Button("1") {
                coordinator.push(.characterDetail)
            }
            Text("2")
            Text("3")
        }
        .navigationTitle("Rick and Morty Characters")
    }
}

#Preview {
    CharactersView()
}
