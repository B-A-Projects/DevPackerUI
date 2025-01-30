//
//  DevPackerUIApp.swift
//  DevPackerUI
//
//  Created by Yannick de Boer on 15/07/2024.
//

import SwiftUI
import SwiftData

@main
struct DevPackerUIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            GameDisc.self,
            GamePackage.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            EnvironmentList()
        }
        .modelContainer(sharedModelContainer)
    }
}
