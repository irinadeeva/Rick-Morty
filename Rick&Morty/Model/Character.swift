//
//  Character.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 22/10/24.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String
    let image: String
    let gender: String
}
