//
//  TodoItemRow.swift
//  YourWorks
//
//  Created by Alimmz on 11/6/25.
//

import SwiftUI
import SwiftData

struct TodoItemRow: View {
    let todo: Todo
    var onChangeCompletedStatus: (Todo) -> Void
    var onDelete: (Todo) ->Void
    var body: some View {
        HStack {
            Toggle(isOn: Binding(
                get: { todo.isCompleted },
                set: { newValue in
                    todo.isCompleted = newValue
                    onChangeCompletedStatus(todo)
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
                onDelete(todo)
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
}

#Preview(traits: .todosSampleData) {
    @Previewable @Query(sort: \Todo.dueDate, order: .forward) var todos: [Todo]
    TodoItemRow(
        todo: todos[0],
        onChangeCompletedStatus: {todo in},
        onDelete: {todo in}
    )
}
