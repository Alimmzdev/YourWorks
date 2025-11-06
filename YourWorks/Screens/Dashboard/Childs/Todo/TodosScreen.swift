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
    @State private var showTodoDetailAndEdit: Bool = false
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Image(systemName: "checkmark.circle")
                        .font(.title)
                        .bold()
                    Text("Todos")
                        .font(.title)
                        .bold()
                    Spacer()
                    Button(action: {
                        showAddTask.toggle()
                    }) {
                        Image(systemName: "plus")
                            .padding()
                    }
                    .buttonBorderShape(.circle)
                    .glassEffect()
                }
                Spacer().frame(maxHeight: 8)
                Text(Date(), style: .date)
                Text("\(todos.filter(\.isCompleted).count) tasks remaining")
                    .font(.caption)
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(.white.opacity(0.3))
                    .cornerRadius(24)
            }
            .padding()
            .foregroundStyle(.white)
            .background(AppColors.primary)
            ScrollView(.vertical) {
                ForEach(todos.filter { !$0.isCompleted}) { todo in
                    TodoItemRow(
                        todo: todo,
                        onChangeCompletedStatus: { todo in
                            changeCompletedStatus(todo: todo)
                        },
                        onDelete: { todo in
                            deleteTodo(todo: todo)
                        }
                    )
                }
                ForEach(todos.filter { $0.isCompleted}) { todo in
                    TodoItemRow(
                        todo: todo,
                        onChangeCompletedStatus: { todo in
                            changeCompletedStatus(todo: todo)
                        },
                        onDelete: { todo in
                            deleteTodo(todo: todo)
                        }
                    )

                }
            }
        }
        .sheet(isPresented: $showAddTask) {
            NewTodoSheetView()
        }
    }
    
    func changeCompletedStatus(todo: Todo) -> Void {
        try? context.save()
    }
    
    func deleteTodo(todo: Todo) -> Void {
        context.delete(todo)
        try? context.save()
    }
}


#Preview(traits: .todosSampleData) {
    TodosScreen()
}
