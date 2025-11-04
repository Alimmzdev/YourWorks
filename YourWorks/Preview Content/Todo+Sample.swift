//
//  Todo+Sample.swift
//  YourWorks
//
//  Created by Alimmz on 11/4/25.
//

import Foundation
import SwiftUI
import SwiftData


extension Todo {
    static let sampleTodos: [Todo] = [
        Todo(
            title: "Buy Groceries",
            explaination: "Pick up groceries for the week including fruits, veggies, and snacks.",
            isCompleted: false,
            dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date()), // Due in 2 days
            createdAt: Date(),
            updatedAt: Date()
        ),
        Todo(
            title: "Finish SwiftUI Project",
            explaination: "Complete the SwiftUI tutorial and submit the project for review.",
            isCompleted: false,
            dueDate: Calendar.current.date(byAdding: .day, value: 5, to: Date()), // Due in 5 days
            createdAt: Date(),
            updatedAt: Date()
        ),
        Todo(
            title: "Call Mom",
            explaination: "Catch up with mom over the phone, check how she's doing.",
            isCompleted: true,
            dueDate: Calendar.current.date(byAdding: .day, value: -1, to: Date()), // Already passed
            createdAt: Date().addingTimeInterval(-86400), // Created 1 day ago
            updatedAt: Date().addingTimeInterval(-86400) // Updated 1 day ago
        ),
        Todo(
            title: "Complete Work Report",
            explaination: "Write and submit the monthly report for work.",
            isCompleted: false,
            dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()), // Due tomorrow
            createdAt: Date(),
            updatedAt: Date()
        ),
        Todo(
            title: "Plan Weekend Trip",
            explaination: "Research and finalize the plans for a weekend getaway to the mountains.",
            isCompleted: false,
            dueDate: Calendar.current.date(byAdding: .month, value: 1, to: Date()), // Due in 1 month
            createdAt: Date(),
            updatedAt: Date()
        )
    ]
}


struct TodoSampleData: PreviewModifier {
    
    
    static func makeSharedContext() async throws -> ModelContainer {
        let container =  try ModelContainer(for: Todo.self, configurations: .init(isStoredInMemoryOnly: true))
        Todo.sampleTodos.forEach { container.mainContext.insert($0) }
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}


extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var todosSampleData: Self = .modifier(TodoSampleData())
}
