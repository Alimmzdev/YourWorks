//
//  TaskDetailsScreen.swift
//  YourWorks
//
//  Created by Alimmz on 11/4/25.
//

import SwiftUI

struct TaskDetailsScreen: View {
    let todo: Todo
    
    init(todo: Todo) {
        self.todo = todo
    }
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            Text(todo.explaination)
                .navigationTitle(todo.title)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Edit") {
                            print("Edit tapped")
                        }
                    }
                }
                .toolbarBackground(.black)
        }
    }
}
