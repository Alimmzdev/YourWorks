//
//  Router.swift
//  YourWorks
//
//  Created by Alimmz on 10/31/25.
//

import SwiftUI
import Combine

enum Route: Hashable {
    case introduction
    case dashboard
    case tasks
    case search
    case favorites
    case profile
}

@MainActor
final class Router: ObservableObject {
    @Published var path = NavigationPath()
    @Published var startRoute: Route = .introduction

    func navigate(to route: Route) {
        path.append(route)
    }

    func reset() {
        path = NavigationPath()
    }

    /// Replace only the last item (keep the root)
    func replaceLast(with route: Route) {
        if !path.isEmpty { path.removeLast() }
        path.append(route)
    }

    /// Clear navigation and set a new root
    func offAllTo(with route: Route) {
        startRoute = route
        path = NavigationPath()
    }
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
