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
            
            Tab("Profile", systemImage: "person") {
                ProfileScreen()
            }
        }
        .tint(AppColors.primary)
    }
}

#Preview {
    DashboardView()
}
