//
//  Item.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/8/23.
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
