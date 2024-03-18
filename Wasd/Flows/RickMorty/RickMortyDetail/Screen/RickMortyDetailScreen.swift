//
//  RickMortyDetailScreen.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 28.12.2023.
//

import SwiftUI

struct RickMortyDetailScreen: View {
    @Bindable var viewModel: RickMortyDetailViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.character.name ?? "")
            Button("Go Back") {
                viewModel.goBackDidTap()
            }
        }
    }
}
