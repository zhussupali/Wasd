//
//  HomeViewModel.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import Foundation

protocol HomeNavigationDelegate: NavigationDelegate {
    func routeDidTap()
    func sheetDidTap()
    func fullScreenDidTap()
}

@Observable
final class HomeViewModel {
    private weak var navigationDelegate: HomeNavigationDelegate?
    
    init(navigationDelegate: HomeNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
    
    func routeDidTap() {
        navigationDelegate?.routeDidTap()
    }
    
    func sheetDidTap() {
        navigationDelegate?.sheetDidTap()
    }
    
    func fullScreenDidTap() {
        navigationDelegate?.fullScreenDidTap()
    }
}
