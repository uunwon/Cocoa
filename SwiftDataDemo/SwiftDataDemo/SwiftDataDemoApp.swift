//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Task.self)
        }
    }
}
