//
//  MemoApp.swift
//  Memo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI

@main
struct MemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self) // modelContext 을 쓰기 위해
        }
    }
}
