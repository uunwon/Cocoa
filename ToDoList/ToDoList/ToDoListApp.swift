//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by uunwon on 4/25/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: MemoTask.self)
        }
    }
}
