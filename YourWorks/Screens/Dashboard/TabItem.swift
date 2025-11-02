//
//  TabItem.swift
//  YourWorks
//
//  Created by Alimmz on 11/1/25.
//

import Foundation

enum TabItem: String, CaseIterable, Identifiable {
    case tasks, search, favorites, profile
    
    var id: String { rawValue }
    
    var title: String {
        rawValue.capitalized
    }
    
    var iconName: String {
        switch self {
        case .tasks: return "house.fill"
        case .search: return "magnifyingglass"
        case .favorites: return "heart.fill"
        case .profile: return "person.fill"
        }
    }
    
    var rootRoute: Route {
        switch self {
        case .tasks: return .tasks
        case .search: return .search
        case .favorites: return .favorites
        case .profile: return .profile
        }
    }
}
