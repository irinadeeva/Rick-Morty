//
//  AppCoordinator.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 22/10/24.
//

import SwiftUI

enum Page {
    case characters
    case characterDetail
}

// TODO: implement, why some view doesn't work, it is ok if i use any here and implement
protocol Coordinator {
    func push()
    func build(page: Page) -> any View
}

@MainActor
final class AppCoordinator: ObservableObject {

    @Published var path = NavigationPath()

    @Published var selectedCharacter: Character?

    func push(_ page: Page) {
        path.append(page)
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .characters:
            charactersView()
        case .characterDetail:
            if let selectedCharacter {
                characterDetailView(selectedCharacter)
            }
        }
    }

    private func charactersView() -> some View {
        let viewModal = CharactersViewModel(characterService: CharacterService())
        let view = CharactersListView(viewModel: viewModal)
        return view
    }

    private func characterDetailView(_ character: Character) -> some View {
        let view = CharacterDetailView(character: character)
        return view
    }
}
