//
//  HomeScreen.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import SwiftUI

struct HomeScreen: View {
    @Bindable var viewModel: HomeViewModel
    
    var body: some View {
        Text("HomeScreen")
        Button("Route") {
            viewModel.routeDidTap()
        }
        Button("Sheet") {
            viewModel.sheetDidTap()
        }
        Button("FullScreen") {
            viewModel.fullScreenDidTap()
        }
        .navigationTitle("Home")
    }
}
