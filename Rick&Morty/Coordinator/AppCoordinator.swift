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
        let service = CharacterServiceImpl()
        let viewModal = CharactersViewModel(characterService: service)
        let view = CharactersListView(viewModel: viewModal)
        return view
    }

    private func characterDetailView(_ character: Character) -> some View {
        let view = CharacterDetailView(character: character)
        return view
    }
}
