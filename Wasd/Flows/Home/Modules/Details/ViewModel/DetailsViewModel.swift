//
//  DetailsViewModel.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import Foundation

protocol DetailsNavigationDelegate: NavigationDelegate {}

@Observable
final class DetailsViewModel {
    private weak var navigationDelegate: DetailsNavigationDelegate?
    
    init(navigationDelegate: DetailsNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
    
    func popDidTap() {
        navigationDelegate?.pop()
    }
    
    func dismissDidTap() {
        navigationDelegate?.dismiss()
    }
}
