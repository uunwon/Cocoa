//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI
import SwiftData

@Model
class Task {
    var id: UUID // var id = UUID() 랑 동일
    var title: String
    var completed: Bool
    
    init(id: UUID = UUID(), title: String, completed: Bool = false) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}

struct ContentView: View {
    @Query var tasks: [Task]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
                            .padding(4)
                        Spacer()
                        
                        if task.completed {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: addTask) {
                        Image(systemName: "arrow.up.heart")
                    }
                    .foregroundStyle(.black)
                    
                    Button(action: deleteTask) {
                        Image(systemName: "heart.slash")
                    }
                    .foregroundStyle(.black)
                }
            }
        }
        .padding(.horizontal, 5)
    }
    
    func addTask() {
        // let newTask = Task(title: "New Task")
        let newTask = Task(title: "🖤 Task no.\(tasks.count+1)")
        modelContext.insert(newTask)
    }
    
    func deleteTask() {
        // self.tasks.removeLast()
    }
}



#Preview {
    ContentView()
        .modelContainer(for: Task.self) // 프리뷰에서 Model 동작하도록
}
