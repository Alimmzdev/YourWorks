//
//  HomeScreen.swift
//  YourWorks
//
//  Created by Alimmz on 10/31/25.
//

import SwiftUI

struct SearchScreen: View {
    @Binding var searchText: String
    
    var body: some View {
        List {
            if searchText.isEmpty {
                Text("Start typing to search…")
            } else {
                Text("Results for “\(searchText)”")
            }
        }
        .navigationTitle("Search")
    }
}

#Preview {
    SearchScreen(searchText: .constant(""))
}
