//
//  ProfileViewModel.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import Foundation

protocol ProfileNavigationDelegate: NavigationDelegate {}

@Observable
final class ProfileViewModel {
    private weak var navigationDelegate: ProfileNavigationDelegate?
    
    init(navigationDelegate: ProfileNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
}
