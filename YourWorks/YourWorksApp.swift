//
//  YourWorksApp.swift
//  YourWorks
//
//  Created by Alimmz on 10/31/25.
//

import SwiftUI
import SwiftData

@main
struct YourWorksApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Todo.self)
    }
}
