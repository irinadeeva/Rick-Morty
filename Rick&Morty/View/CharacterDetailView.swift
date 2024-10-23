//
//  CharacterDetailView.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 22/10/24.
//

import SwiftUI

struct CharacterDetailView: View {

    let character: Character

    var body: some View {
        ScrollView {
            Image(systemName: "person.circle")
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.title)

                HStack {
                    Text(character.species)
                    Spacer()
                    Text(character.gender)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                Text("About \(character.name)")
                    .font(.title2)
                Text(character.status)
            }
            .padding()
        }
    }
}

#Preview {
    CharacterDetailView(character: rick)
}
