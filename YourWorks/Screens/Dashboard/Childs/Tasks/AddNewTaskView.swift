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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Task Title", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .font(.headline)
                    .textFieldStyle(PlainTextFieldStyle())
                
                TextField("Task Title", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .font(.headline)
                    .textFieldStyle(PlainTextFieldStyle())
                
                Button(action: addNewTodo) {
                    Text("Add")
                        .padding()
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .glassEffect(.regular.tint(AppColors.primary))
                
                Spacer()
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
        let newTodo = Todo(title: title, explaination: explanation, isCompleted: false,updatedAt: Date())
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
