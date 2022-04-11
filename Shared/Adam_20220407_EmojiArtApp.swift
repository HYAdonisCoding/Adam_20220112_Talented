//
//  Adam_20220407_EmojiArtApp.swift
//  Shared
//
//  Created by Adam on 2022/4/7.
//

import SwiftUI

@main
struct Adam_20220407_EmojiArtApp: App {
    let persistenceController = PersistenceController.shared

    let document = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
