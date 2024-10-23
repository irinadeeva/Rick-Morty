//
//  CharacterRow.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 23/10/24.
//

import SwiftUI

struct CharacterRowView: View {
    
    let character: Character

    var body: some View {
        HStack {
//            Image(systemName: "person.circle")
//                .resizable()
//                .frame(width: 50, height: 50)

            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.5)
            }
            .frame(width: 100, height: 100)
            .clipShape(.rect(cornerRadius: 25))

            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                    .bold()
                Text(character.gender)
                    .font(.subheadline)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    CharacterRowView(character: Character(id: 1, name: "Rick Sanchez", status: "", species: "", type: "", gender: "Male", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [])
    )
}
