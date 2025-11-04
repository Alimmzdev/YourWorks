//
//  DashboardView.swift
//  YourWorks
//
//  Created by Alimmz on 11/1/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        TabView {
            Tab("Tasks", systemImage: "checkmark.circle") {
                TodosScreen()
            }
            
            // 🟨 Favorites Tab
            Tab("Favorites", systemImage: "heart") {
                FavoritesScreen()
            }
            
            // 🟦 Profile Tab
            Tab("Profile", systemImage: "person") {
                ProfileScreen()
            }
            
            Tab("Search", systemImage: "magnifyingglass", role: .search) {
                NavigationStack {
                    SearchScreen(searchText: $searchText)
                }
            }
        }
        .tint(AppColors.primary)
        .searchable(text: $searchText, placement: .toolbar)
    }
}

#Preview {
    DashboardView()
}
