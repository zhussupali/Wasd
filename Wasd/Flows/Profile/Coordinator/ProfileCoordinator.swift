//
//  ProfileCoordinator.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import SwiftUI

enum ProfileRoute: Identifiable {
    var id: Self { self }
    case profile
}

final class ProfileCoordinator: Coordinator<ProfileRoute> {
    @ViewBuilder
    func build(route: ProfileRoute) -> some View {
        switch route {
        case .profile:
            ProfileScreen(viewModel: ProfileViewModel(navigationDelegate: self))
        }
    }
}

// MARK: - ProfileNavigationDelegate

extension ProfileCoordinator: ProfileNavigationDelegate {
    
}
