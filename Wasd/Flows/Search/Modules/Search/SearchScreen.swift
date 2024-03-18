//
//  SearchScreen.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import SwiftUI

struct SearchScreen: View {
    @Bindable var viewModel: SearchViewModel
    
    var body: some View {
        Text("SearchScreen")
        Button("Dismiss") {
            viewModel.dismiss()
        }
    }
}

protocol SearchNavigationDelegate: NavigationDelegate {
    
}

@Observable
final class SearchViewModel {
    private weak var navigationDelegate: SearchNavigationDelegate?
    
    init(navigationDelegate: SearchNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
    
    func dismiss() {
        navigationDelegate?.dismissFromParent()
    }
}
