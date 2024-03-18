//
//  SearchCoordinator.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import SwiftUI

enum SearchRoute: Identifiable {
    var id: Self { self }
    case search
}

final class SearchCoordinator: Coordinator<SearchRoute> {
    @ViewBuilder
    func build(route: SearchRoute) -> some View {
        switch route {
        case .search:
            SearchScreen(viewModel: SearchViewModel(navigationDelegate: self))
        }
    }
}

// MARK: - SearchNavigationDelegate

extension SearchCoordinator: SearchNavigationDelegate {
    
}
