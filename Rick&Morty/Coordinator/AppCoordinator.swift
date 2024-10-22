//
//  AppCoordinator.swift
//  Rick&Morty
//
//  Created by Irina Deeva on 22/10/24.
//

import SwiftUI

// TODO: why String, Identifiable , not Hashable?
enum Page: String, Identifiable {
    case characters, characterDetail

    var id: String {
        self.rawValue
    }
}

// TODO: implement, why some view dosnt work, it is ok if i use any here and implement
protocol Coordinator {
    func push()
    func build(page: Page) -> any View
}

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ page: Page) {
        path.append (page)
    }

    // TODO: delete?
    //    func pop() {
    //        path.removeLast()
    //    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
            case .characters:
                charactersView()
            case .characterDetail:
                characterDetailView()
        }
    }

    private func charactersView() -> some View {
        //  TODO: Использовать Dependency Injection (VM)

        return CharactersView()
    }

    private func characterDetailView() -> some View {
        //  TODO: Использовать Dependency Injection (VM)

        return CharacterDetailView()
    }

}
