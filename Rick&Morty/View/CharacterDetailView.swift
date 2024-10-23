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

            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray.opacity(0.5)
            }
            .frame(width: 250, height: 250)
            .clipShape(.circle)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)

            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.title)
                    .bold()

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
                    .fontWeight(.semibold)
                Spacer()
                VStack(alignment: .leading) {
                    Text("☠️  Status: \(character.status)")
                    Text("🤖  Species: \(character.species)")
                    Text("🪐  Origin: \(character.origin.name)")
                    Text("📍  Location: \(character.location.name)")
                }
                .padding(.leading)

                Divider()

                Text("Appears in episodes")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                ForEach(character.episode, id: \.self) { episodeUrl in
                    if let episodeNumber = episodeUrl.split(separator: "/").last {
                        Text("Episode \(episodeNumber)")
                            .padding(.leading)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CharacterDetailView(character: Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", origin: Origin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [ "https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"])
    )
}
