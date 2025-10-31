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
    case home
}

class Router: ObservableObject {
    @Published var path = NavigationPath()
    @Published var startRoute: Route = .introduction
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    func replaceLastScreen(with route: Route) {
        let newPath = NavigationPath(path.removeLast())
        newPath.append(route)
        path = newPath
    }
    
    func reset() {
        path.removeLast(path.count)
    }
}
