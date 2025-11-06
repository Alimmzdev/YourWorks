//
//  HomeScreen.swift
//  YourWorks
//
//  Created by Alimmz on 10/31/25.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(maxHeight: 16)
            Circle()
                .fill(AppColors.primary)
                .frame(width:96, height: 96)
                .overlay(
                    Image(systemName: "person")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                )
            Spacer()
                .frame(maxHeight: 8)
            Text("Alimmzdev")
                .font(.largeTitle)
                .bold()
            Text("Mobile Application Developer")
                .font(.title2)
                .foregroundColor(.secondary)
            List {
                Section(header: Text("App Info")) {
                    HStack {
                        Text("Version: ")
                        Spacer()
                        Text("1.0.0")
                    }
                    HStack {
                        Text("Developer Github: ")
                        Spacer()
                        Text("Alimmzdev")
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileScreen()
}
