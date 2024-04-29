//
//  MemoTask.swift
//  ToDoList
//
//  Created by uunwon on 4/25/24.
//

import Foundation
import SwiftData

enum Priority: Comparable, Codable {
    case high
    case medium
    case low
}

extension MemoTask {
    static var tasks = [
        MemoTask(completed: false, descriptionTask: "Wake up", priority: .low),
        MemoTask(completed: false, descriptionTask: "Shower", priority: .medium),
        MemoTask(completed: false, descriptionTask: "Code", priority: .high),
        MemoTask(completed: false, descriptionTask: "Eat", priority: .high),
        MemoTask(completed: false, descriptionTask: "Sleep", priority: .high),
        MemoTask(completed: false, descriptionTask: "Get groceries", priority: .high)
    ]
    
    static var task = tasks[0]
}

@Model
class MemoTask: Identifiable {
    var id = UUID()
    var completed: Bool
    var descriptionTask: String
    var priority: Priority
    
    init(completed: Bool, descriptionTask: String, priority: Priority) {
        self.completed = completed
        self.descriptionTask = descriptionTask
        self.priority = priority
    }
}
