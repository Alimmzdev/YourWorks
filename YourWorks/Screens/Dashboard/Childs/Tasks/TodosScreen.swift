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
    
    fileprivate func TodoRow(_ todo: Todo) -> some View {
        return HStack {
            Toggle(isOn: Binding(
                get: { todo.isCompleted },
                set: { newValue in
                    todo.isCompleted = newValue
                    try? context.save()
                }
            )) {
                Group {
                    if !todo.isCompleted {
                        Circle()
                            .stroke(Color.gray, lineWidth: 2)
                            .frame(width: 32, height: 32)
                    } else {
                        Circle()
                            .fill(Color.blue)
                            .frame(width:32, height: 32)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .bold))
                            )
                    }
                }
            }
            .toggleStyle(.button)
            .tint(.blue)
            .buttonStyle(PlainButtonStyle())
            Spacer()
                .frame(maxWidth: 12)
            Text(todo.title)
                .font(.headline)
                .foregroundStyle(todo.isCompleted ? AppColors.secondary : .black)
                .strikethrough(todo.isCompleted)
            Spacer()
            Button(action: {
                context.delete(todo)
                try? context.save()
            }){
                Image(systemName: "trash")
                    .padding()
                    .tint(.white)
            }
            .frame(maxWidth: 40, maxHeight: 40.0)
            .glassEffect(.regular.tint(Color.red).interactive())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.secondarySystemBackground), lineWidth: 1)
        )
        .padding(.horizontal)
        .padding(.vertical , 4.0)
    }
    
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
                    TodoRow(todo)
                }
                ForEach(todos.filter { $0.isCompleted}) { todo in
                    TodoRow(todo)
                }
            }
        }
        .sheet(isPresented: $showAddTask) {
            NewTodoSheetView()
        }
    }
}


#Preview(traits: .todosSampleData) {
    TodosScreen()
}
