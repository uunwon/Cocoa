//
//  ContentView.swift
//  ToDoList
//
//  Created by uunwon on 4/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var tasks: [MemoTask]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks, id: \.id) { task in
                    HStack(spacing: 20) {
                        Button(action: {
                            task.completed.toggle()
                        }) {
                            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                                .imageScale(.large)
                        }
                        Text(" Task : \(task.descriptionTask)")
                        
                        Spacer()
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("To do list")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: MemoTask.self, inMemory: true)
}
