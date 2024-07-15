//
//  DevPackerUIApp.swift
//  DevPackerUI
//
//  Created by Yannick de Boer on 10/07/2024.
//

import SwiftUI
import SwiftData
<<<<<<< HEAD
import DevPackerLib
=======
>>>>>>> 92216bcd06f111cdcdbd0219e62a1db4b867de17

@main
struct DevPackerUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
<<<<<<< HEAD
    
=======

>>>>>>> 92216bcd06f111cdcdbd0219e62a1db4b867de17
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
