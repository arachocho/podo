//
//  Todo.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import Foundation
import SwiftData

enum Priority: Int, Identifiable, CaseIterable {
    case routine
    case high
    case low

    var id: Self { self}
       
       var description: String {
           switch self {
           case .routine:
               return "routine"
           case .high:
               return "high"
           case .low:
               return "low"
           }
       }
    
}

@Model
final class Todo {
    @Attribute(.unique)
    var id: UUID
    
    var content: String
    var createdAt: Date
    var completed: Bool
    var color: String
    var priority: Int
    
    init(content: String, createdAt: Date = Date(), completed: Bool = false, color: SelectColor, priority:Priority) {
        self.id = UUID()
        self.content = content
        self.createdAt = createdAt
        self.completed = completed
        self.color = color.rawValue
        self.priority = priority.rawValue
    }
}
