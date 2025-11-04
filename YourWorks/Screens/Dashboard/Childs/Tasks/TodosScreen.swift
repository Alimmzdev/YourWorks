//
//  HomeScreen.swift
//  YourWorks
//
//  Created by Alimmz on 10/31/25.
//

import SwiftUI
import SwiftData

struct TodosScreen: View {
    @Query(sort: \Todo.dueDate, order: .forward) private var todos: [Todo]
    @State private var showAddTask: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Home")
                    .font(.title)
                Spacer()
                Button(action: {}){
                    Image(systemName: "plus")
                }
                .glassEffect()
            }
            ScrollView(.vertical) {
                ForEach(todos) { todo in
                    GlassEffectContainer {
                        HStack {
                            Text(todo.title)
                                .font(.headline)
                            Spacer()
                            Button(action: {}){
                                Image(systemName: "chevron.right")
                            }
                            .glassEffect(.regular.tint(AppColors.primary).interactive())
                        }
                        .padding()
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}


#Preview(traits: .todosSampleData) {
    @Previewable @Query(sort: \Todo.title) var todos: [Todo]
    TodosScreen(todo: todos[0])
}
