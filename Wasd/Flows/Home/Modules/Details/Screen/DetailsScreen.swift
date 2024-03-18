//
//  DetailsScreen.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import SwiftUI

struct DetailsScreen: View {
    @Bindable var viewModel: DetailsViewModel
    
    var body: some View {
        Text("DetailsScreen")
        Button("Pop") {
            viewModel.popDidTap()
        }
        Button("dismissSheet") {
            viewModel.dismissDidTap()
        }
    }
}
