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
                switch router.startRoute {
                case .introduction:
                    IntroductionScreen()
                case .dashboard:
                    DashboardView()
                default:
                    IntroductionScreen()
                }
            }
            .navigationDestination(for: Route.self) { route in
                routeDestination(for: route)
            }
        }
        .environmentObject(router)
    }
    
    @ViewBuilder
    private func routeDestination(for route: Route) -> some View {
        switch route {
            
        case .dashboard:
            DashboardView()
        case .tasks:
            TodosScreen()
        case .profile:
            ProfileScreen()
        default:
            IntroductionScreen()
        }
    }
}

#Preview {
    RootView()
}
