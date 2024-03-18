//
//  RickMortyDetailViewModel.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.03.2024.
//

import Foundation

protocol RickMortyDetailNavigationDelegate: AnyObject {
    func goBackDidTap()
}

@Observable
final class RickMortyDetailViewModel {
    var character: RickMortyDto.Result
    private weak var navigationDelegate: RickMortyDetailNavigationDelegate?
    
    init(character: RickMortyDto.Result, navigationDelegate: RickMortyDetailNavigationDelegate?) {
        self.character = character
        self.navigationDelegate = navigationDelegate
    }
    
    func goBackDidTap() {
        navigationDelegate?.goBackDidTap()
    }
}
