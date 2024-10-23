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

//    @State private var showAlert = false

    init(viewModel: CharactersViewModel) {
        _characterVM = StateObject(wrappedValue: viewModel)
    }

    @ViewBuilder
    var content: some View {
        if characterVM.characters.isEmpty {
            LoadingView()
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
        .listStyle(.inset)
    }

    var body: some View {
        content
            .navigationTitle("Characters")
            .alert(isPresented: $characterVM.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(characterVM.errorMessage ?? "Unknown error"),
                    primaryButton: .default(Text("Try again")) {
                        characterVM.showAlert = false
                        characterVM.retry()
                    },
                    secondaryButton: .cancel() {
                    characterVM.showAlert = false
                })
            }
    }
}

#Preview {
    CharactersListView(viewModel: CharactersViewModel(characterService: CharacterServiceImpl()))
}
