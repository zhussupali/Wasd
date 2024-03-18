//
//  HomeCoordinator.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import SwiftUI

enum HomeRoute: Identifiable {
    var id: Self { self }
    case home
    case details
    case profile
    case search
}

final class HomeCoordinator: Coordinator<HomeRoute> {
    @Bindable var profileCoordinator: ProfileCoordinator
    @Bindable var searchCoordinator: SearchCoordinator
    
    override init() {
        profileCoordinator = ProfileCoordinator()
        searchCoordinator = SearchCoordinator()
        super.init()
        profileCoordinator.parent = self
        searchCoordinator.parent = self
    }
    
    @ViewBuilder
    func build(route: HomeRoute) -> some View {
        switch route {
        case .home:
            HomeScreen(viewModel: HomeViewModel(navigationDelegate: self))
        case .details:
            DetailsScreen(viewModel: DetailsViewModel(navigationDelegate: self))
        case .profile:
            NavigationStack(path: $profileCoordinator.path) {
                profileCoordinator.build(route: .profile)
                    .navigationDestination(for: ProfileRoute.self) { route in
                        self.profileCoordinator.build(route: route)
                    }
                    .sheet(item: $profileCoordinator.sheet) { route in
                        self.profileCoordinator.build(route: route)
                    }
                    .fullScreenCover(item: $profileCoordinator.fullScreen) { route in
                        self.profileCoordinator.build(route: route)
                    }
            }
        case .search:
            NavigationStack(path: $searchCoordinator.path) {
                searchCoordinator.build(route: .search)
                    .navigationDestination(for: SearchRoute.self) { route in
                        self.searchCoordinator.build(route: route)
                    }
                    .sheet(item: $searchCoordinator.sheet) { route in
                        self.searchCoordinator.build(route: route)
                    }
                    .fullScreenCover(item: $searchCoordinator.fullScreen) { route in
                        self.searchCoordinator.build(route: route)
                    }
            }
        }
    }
}

// MARK: - HomeNavigationDeelegate

extension HomeCoordinator: HomeNavigationDelegate {
    func routeDidTap() {
        push(.details)
    }
    
    func sheetDidTap() {
        present(sheet: .search)
    }
    
    func fullScreenDidTap() {
        present(fullScreen: .search)
    }
}

// MARK: - DetailsNavigationDelegate

extension HomeCoordinator: DetailsNavigationDelegate {}
