//
//  DashboardView.swift
//  YourWorks
//
//  Created by Alimmz on 11/1/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var selection: TabItem = .home
    
    var body: some View {
        TabView(selection: $selection) {
            HomeScreen()
                .tabItem {
                    Label(TabItem.home.title, systemImage: TabItem.home.iconName)
                }
                .tag(TabItem.home)
            
            SearchScreen()
                .tabItem {
                    Label(TabItem.search.title, systemImage: TabItem.search.iconName)
                }
                .tag(TabItem.search)
            
            FavoritesScreen()
                .tabItem {
                    Label(TabItem.favorites.title, systemImage: TabItem.favorites.iconName)
                }
                .tag(TabItem.favorites)
            
            ProfileScreen()
                .tabItem {
                    Label(TabItem.profile.title, systemImage: TabItem.profile.iconName)
                }
                .tag(TabItem.profile)
        }
        .tint(AppColors.primary)
    
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
