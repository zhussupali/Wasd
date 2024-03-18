//
//  RickMortyScreen.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 27.12.2023.
//

import SwiftUI

struct RickMortyScreen: View {
    @State var viewModel: RickMortyViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            List(viewModel.characters) { character in
                makeCell(item: character)
                    .onTapGesture {
                        viewModel.onTap(character: character)
                    }
            }
            Banner(isShown: $viewModel.bannerIsShown) {
                Text("Error")
            }
        }
        .toolbar {
            Button("About") {
                print(viewModel.characters.count)
            }
        }
        .navigationTitle("Hello")
        .onAppear() {
            viewModel.onAppear()
        }
    }
    
    @ViewBuilder
    func makeCell(item: RickMortyDto.Result) -> some View {
        HStack {
            if let url = URL(string: item.image ?? "") {
                AsyncImage(url: url) { phase in
                    phase.image?.resizable()
                }
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            Text(item.name ?? "")
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
    }
}
