//
//  CharacterService.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 22/10/24.
//

import Foundation

protocol CharacterService {
    func fetchCharactersNextPage(page: Int) async throws -> [Character]
}

final class CharacterServiceImpl: CharacterService {

    func fetchCharactersNextPage(page: Int) async throws -> [Character] {
        let serviceResponse = try await Network.shared.fetch(page: page) ?? CharacterResponse(results: [])

        return serviceResponse.results
    }
}
