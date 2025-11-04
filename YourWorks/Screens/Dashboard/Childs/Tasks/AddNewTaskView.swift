//
//  AddNewTaskView.swift
//  YourWorks
//
//  Created by Alimmz on 11/2/25.
//

import SwiftUI
import SwiftData

struct AddNewTaskView: View {
    
    @State private var title: String = ""
    @State private var explanation: String = ""
    @State private var dueDate: Date = Date()
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack(spacing: 16) {
            Section(header: Text("Task Info")
                .font(.headline)) {
                    TextField("Title", text: $title)
                        .padding()
                        .glassEffect()
                    TextField("Explanation", text: $explanation)
                        .padding()
                        .glassEffect()
                    
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                        .padding()
                }
            Spacer()
            Button(action: {
                let newTask = Todo(title: title, explaination: explanation, isCompleted: false, dueDate: dueDate, createdAt: Date(), updatedAt: Date())
                context.insert(newTask)
                do{
                    try context.save()
                    dismiss()
                } catch {
                    print("Error saving context: \(error.localizedDescription)")
                }
            }) {
                Text("Add New Task")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            .glassEffect(.regular.tint(AppColors.primary).interactive())
            .padding()
        }
        .padding()
    }
}

#Preview {
    AddNewTaskView()
}
