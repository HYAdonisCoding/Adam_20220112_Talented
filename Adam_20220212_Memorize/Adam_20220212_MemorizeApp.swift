//
//  Adam_20220212_MemorizeApp.swift
//  Adam_20220212_Memorize
//
//  Created by Adam on 2022/2/14.
//

import SwiftUI

@main
struct Adam_20220212_MemorizeApp: App {
    let persistenceController = PersistenceController.shared

    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
