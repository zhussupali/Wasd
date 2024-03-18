//
//  Coordinator.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import SwiftUI

public protocol NavigationDelegate: AnyObject {
    func pop()
    func popToRoot()
    func dismiss()
    func dismissFromParent()
}

@Observable
open class Coordinator<R: Hashable & Identifiable>: NavigationDelegate {
    public var path = NavigationPath()
    public var sheet: R?
    public var fullScreen: R?
    
    public weak var parent: NavigationDelegate?
    
    public func push(_ screen: R) {
        path.append(screen)
    }
    
    public func present(sheet: R) {
        self.sheet = sheet
    }
    
    public func present(fullScreen: R) {
        self.fullScreen = fullScreen
    }
    
    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    public func popToRoot() {
        path = NavigationPath()
    }
    
    public func dismiss() {
        sheet = nil
        fullScreen = nil
    }
    
    public func dismissFromParent() {
        parent?.dismiss()
    }
}

