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

    @StateObject var document = EmojiArtDocument()
    @StateObject var paletteStore = PaletteStore(named: "Default")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
                .environmentObject(paletteStore)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
