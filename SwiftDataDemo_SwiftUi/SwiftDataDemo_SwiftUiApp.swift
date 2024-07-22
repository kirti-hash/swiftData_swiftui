//
//  SwiftDataDemo_SwiftUiApp.swift
//  SwiftDataDemo_SwiftUi
//
//  Created by MRT102 on 27/10/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemo_SwiftUiApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//            ToDoItem.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
       // .modelContainer(sharedModelContainer)
//       .modelContainer(for: ToDoItem.self)
        .modelContainer(for: [Item.self,ToDoItem.self])
    }
}
