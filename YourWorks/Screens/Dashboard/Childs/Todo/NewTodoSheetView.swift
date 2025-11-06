//
//  AddNewTaskView.swift
//  YourWorks
//
//  Created by Alimmz on 11/2/25.
//

import SwiftUI
import SwiftData

struct NewTodoSheetView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var title: String = ""
    @State private var explanation: String = ""
    @State private var dueDate: Date = Date()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .font(.headline)
                    .textFieldStyle(PlainTextFieldStyle())
                
                TextField("Description", text: $explanation)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .font(.headline)
                    .textFieldStyle(PlainTextFieldStyle())
                
                DatePicker(
                    "Select due date",
                    selection: $dueDate,
                    displayedComponents: [.date]
                )
                .padding()
                Spacer()
                Button(action: addNewTodo) {
                    Text("Add")
                        .padding()
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .glassEffect(.regular.tint(AppColors.primary))
            }
            .padding()
            .navigationTitle("New Task")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            }
        }
    }
    
    private func addNewTodo() {
        let newTodo = Todo(
            title: title,
            explaination: explanation,
            isCompleted: false,
            dueDate: dueDate,
            updatedAt: Date()
        )
        context.insert(newTodo)
        do {
            try context.save()
        } catch {
            print("error when save new todo ...")
        }
        dismiss()
    }
}

#Preview {
    NewTodoSheetView()
}
