//
//  ContentView.swift
//  YourWorks
//
//  Created by Alimmz on 10/31/25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            Group {
                IntroductionScreen()
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .introduction:
                    IntroductionScreen()
                case .home:
                    HomeScreen()
                }
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    RootView()
}
