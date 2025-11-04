//
//  DashboardView.swift
//  YourWorks
//
//  Created by Alimmz on 11/1/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var searchText: String = ""
    @State private var showAddNewtodo: Bool = false
    
    var body: some View {
        TabView {
            Tab("Tasks", systemImage: "checkmark.circle") {
                TodosScreen()
            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoritesScreen()
            }
            
            Tab("Profile", systemImage: "person") {
                ProfileScreen()
            }
            
            Tab("Add New Task", systemImage: "plus", role: .search) {
                NavigationView {}
                    .sheet(isPresented: $showAddNewtodo) {
                        NewTodoSheetView()
                    }
            }
        }
        .tint(AppColors.primary)
    }
}

#Preview {
    DashboardView()
}
