//
//  Character.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 22/10/24.
//

import Foundation

struct Character: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]

    // TODO: delete
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: Origin, location: Location, image: String, episode: [String]) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
    }
}

struct Origin: Codable, Equatable {
    let name: String
    let url: String
}

struct Location: Codable, Equatable {
    let name: String
    let url: String
}

