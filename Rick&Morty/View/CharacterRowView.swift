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
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
            VStack {
                Text(character.name)
                Text(character.gender)
            }
            Spacer()
        }
    }
}

#Preview {
    CharacterRowView(character: rick)
}
