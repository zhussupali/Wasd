//
//  RickMortyViewModel.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 28.12.2023.
//

import SwiftUI

protocol RickMortyNavigationDelegate: NavigationDelegate {
    func characterDidTap(_ character: RickMortyDto.Result)
}

@Observable
final class RickMortyViewModel {
    var characters = [RickMortyDto.Result]()
    var bannerIsShown = false
    private let url = "https://rickandmortyapi.com/api/character"
    private let navigationDelegate: RickMortyNavigationDelegate
    
    init(navigationDelegate: RickMortyNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
    
    @MainActor
    func onAppear() {
        Task {
            do {
                guard let url = URL(string: url) else { return }
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let rnmData = try JSONDecoder().decode(RickMortyDto.self, from: data)
                print(rnmData)
                characters = rnmData.results ?? []
            } catch {
                print("Error", error)
                withAnimation { bannerIsShown = true }
            }
        }
    }
    
    func onTap(character: RickMortyDto.Result) {
        navigationDelegate.characterDidTap(character)
    }
}
