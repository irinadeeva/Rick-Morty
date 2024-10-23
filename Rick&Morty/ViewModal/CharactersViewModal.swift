//
//  CharactersViewModal.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 22/10/24.
//

import Foundation

@MainActor
final class CharactersViewModel: ObservableObject {

    @Published var characters = [Character]()

    @Published var errorMessage: String? = nil

    @Published var showAlert = false

    private let characterService: CharacterService
    
    private var currentPage = 1

    init(characterService: CharacterService) {
        self.characterService = characterService
        Task {
            await fetchCharacters()
        }
    }

    func loadMoreCharactersIfNeeded(currentCharacter: Character) {
        if characters.last == currentCharacter {
            Task {
                await fetchCharacters()
            }
        }
    }

    func retry() {
        Task {
            await fetchCharacters()
        }
    }

    private func fetchCharacters() async {
        errorMessage = nil

        do {
            let newCharacters = try await characterService.fetchCharactersNextPage(page: currentPage)
            characters.append(contentsOf: newCharacters)
            currentPage += 1
        } catch {
            showAlert = true
            errorMessage = "Character loading error: \(error.localizedDescription)"
        }
    }
}
