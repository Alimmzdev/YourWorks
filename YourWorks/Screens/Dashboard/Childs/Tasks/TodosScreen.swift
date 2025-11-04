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
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Image(systemName: "checkmark.circle")
                        .font(.title)
                        .bold()
                    Text("Todos")
                        .font(.title)
                        .bold()
                    Spacer()
                    Text("2 tasks remaining")
                        .font(.caption)
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background(.white.opacity(0.3))
                        .cornerRadius(24)
                    
                }
                Spacer().frame(maxHeight: 8)
                Text(Date(), style: .date)
            }
            .padding()
            .foregroundStyle(.white)
            .background(AppColors.primary)
            ScrollView(.vertical) {
                ForEach(todos) { todo in
                    HStack {
                        Text(todo.title)
                            .font(.headline)
                        Spacer()
                        Button(action: {}){
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
                            .fill(Color.white) // Set the background color inside the rounded corners
                    )
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(.secondarySystemBackground), lineWidth: 1) // Border applied outside the rounded corners
                    )
                    .padding(.horizontal)
                    .padding(.vertical , 4.0)
                }
            }
        }
    }
}


#Preview(traits: .todosSampleData) {
    TodosScreen()
}
