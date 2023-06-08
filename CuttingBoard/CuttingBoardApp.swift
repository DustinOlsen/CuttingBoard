//
//  CuttingBoardApp.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/8/23.
//

import SwiftUI
import SwiftData

@main
struct CuttingBoardApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
