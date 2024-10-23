//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 22/10/24.
//

import SwiftUI

struct CharactersListView: View {

    @EnvironmentObject private var coordinator: AppCoordinator

    @StateObject private var characterVM: CharactersViewModel
    
    @State private var showAlert = false

    init(viewModel: CharactersViewModel) {
        _characterVM = StateObject(wrappedValue: viewModel)
    }

    @ViewBuilder
    var content: some View {
        if characterVM.characters.isEmpty {
            LoadingView()
        } else if let errorMessage = characterVM.errorMessage {
            VStack {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
                Button("Try again") {
                    characterVM.retry()
                }
            }
            .padding()
        } else {
            list
        }
    }

    var list: some View {
        List(characterVM.characters) { character in
            CharacterRowView(character: character)
                .onAppear {
                    characterVM.loadMoreCharactersIfNeeded(currentCharacter: character)
                }
                .onTapGesture {
                    coordinator.selectedCharacter = character
                    coordinator.push(.characterDetail)
                }
        }
    }

    var body: some View {
        content
            .navigationTitle("Characters")
            .background(Color(.systemBackground))

    }
}

#Preview {
    CharactersListView(viewModel: CharactersViewModel(characterService: CharacterService()))
}
