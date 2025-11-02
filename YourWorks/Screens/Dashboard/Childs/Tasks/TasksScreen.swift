//
//  HomeScreen.swift
//  YourWorks
//
//  Created by Alimmz on 10/31/25.
//

import SwiftUI

struct TasksScreen: View {
    @State private var showAddTask: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: Text("Task 1 Details Screen")) {
                        Text("Task 1")
                    }
                    Text("Task 2")
                    Text("Task 3")
                }
            }
            .navigationTitle(Text("Tasks"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddTask.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddNewTaskView()
            }
        }
    }
}


#Preview {
    TasksScreen()
}
