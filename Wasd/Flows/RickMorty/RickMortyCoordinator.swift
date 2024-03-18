//
//  RickMortyCoordinator.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 28.12.2023.
//

import SwiftUI

enum RickMortyRoute: Hashable, Identifiable {
    var id: Self { self }
    case rickMorty
    case details(character: RickMortyDto.Result)
}

final class RickMortyCoordinator: Coordinator<RickMortyRoute> {
    
    @ViewBuilder
    func build(route: RickMortyRoute) -> some View {
        switch route {
        case .rickMorty:
            RickMortyScreen(viewModel: .init(navigationDelegate: self))
        case let .details(character):
            RickMortyDetailScreen(viewModel: .init(character: character, navigationDelegate: self))
        }
    }
}

// MARK: - RickMortyNavigationDelegate

extension RickMortyCoordinator: RickMortyNavigationDelegate {
    func characterDidTap(_ character: RickMortyDto.Result) {
        push(.details(character: character))
    }
}


// MARK: - RickMortyDetailNavigationDelegate

extension RickMortyCoordinator: RickMortyDetailNavigationDelegate {
    func goBackDidTap() {
        pop()
    }
}
