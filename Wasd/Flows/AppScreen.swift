//
//  AppScreen.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import SwiftUI

@Observable
final class AppRouter {
    enum AppRoute {
        case home
        case content
        case rickMorty
    }
    
    static let shared = AppRouter()
    var current: AppRoute = .rickMorty
    private init() {}
}

struct AppScreen: View {
    @Bindable private var appRouter = AppRouter.shared
    @Bindable private var homeCoordinator = HomeCoordinator()
    @Bindable private var rickMortyCoordinator = RickMortyCoordinator()
    
    var body: some View {
        switch appRouter.current {
        case .home:
            NavigationStack(path: $homeCoordinator.path) {
                homeCoordinator.build(route: .home)
                    .navigationDestination(for: HomeRoute.self) { route in
                        homeCoordinator.build(route: route)
                    }
                    .sheet(item: $homeCoordinator.sheet) { route in
                        homeCoordinator.build(route: route)
                    }
                    .fullScreenCover(item: $homeCoordinator.fullScreen) { route in
                        homeCoordinator.build(route: route)
                    }
            }
        case .content:
            ContentView()
        case .rickMorty:
            NavigationStack(path: $rickMortyCoordinator.path) {
                rickMortyCoordinator.build(route: .rickMorty)
                    .navigationDestination(for: RickMortyRoute.self) { route in
                        rickMortyCoordinator.build(route: route)
                    }
                    .sheet(item: $rickMortyCoordinator.sheet) { route in
                        rickMortyCoordinator.build(route: route)
                    }
                    .fullScreenCover(item: $rickMortyCoordinator.fullScreen) { route in
                        rickMortyCoordinator.build(route: route)
                    }
            }
        }
    }
}
