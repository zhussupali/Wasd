//
//  Banner.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 27.12.2023.
//

import SwiftUI

struct Banner<Content: View>: View {
    @Binding var isShown: Bool
    private var height: CGFloat = 70
    private var content: () -> Content
    
    init(isShown: Binding<Bool>, content: @escaping () -> Content) {
        _isShown = isShown
        self.content = content
    }
    
    var body: some View {
        VStack {
            if isShown {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue)
                        .frame(
                            width: UIScreen.main.bounds.width * 0.9,
                            height: height
                        )
                    content()
                }
                .transition(
                    .move(edge: .bottom)
                    .combined(with: .offset(.init(width: 0, height: height)))
                )
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation { isShown = false }
            }
        }
    }
}
