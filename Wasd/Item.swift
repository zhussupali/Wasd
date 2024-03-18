//
//  Item.swift
//  Wasd
//
//  Created by Zhussupali Salamat on 19.12.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
