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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
