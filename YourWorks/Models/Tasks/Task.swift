//
//  Task.swift
//  YourWorks
//
//  Created by Alimmz on 11/2/25.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    var id: UUID
    var title: String
    var explaination: String
    var isCompleted: Bool
    var dueDate: Date?
    var createdAt: Date
    var updatedAt: Date
    
    init(id: UUID = UUID(), title: String, explaination: String, isCompleted: Bool, dueDate: Date? = nil, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.title = title
        self.explaination = explaination
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
