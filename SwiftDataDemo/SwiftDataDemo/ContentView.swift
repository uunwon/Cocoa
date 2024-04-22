//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI
import SwiftData

@Model
class Task { // Identifiable 은 Model 에 포함되어있음
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
                        Button(action: {
                            toggleCompletion(for: task)
                        }) {
                            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(.black)
                        }
                        Text(task.title)
                            .padding(4)
                        
                        Spacer()
                        
                        if task.completed {
                            Image(systemName: "checkmark")
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            deleteTask(task)
                        } label: {
                        Label("Delete", systemImage: "heart.slash")
                        }
                    }
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: addTask) {
                        Image(systemName: "bolt.heart")
                    }
                    .foregroundStyle(.black)
                }
            }
        }
        .padding(.horizontal, 5)
    }
    
    func addTask() { // add
        // let newTask = Task(title: "New Task")
        let newTask = Task(title: "🖤 Task no.\(tasks.count+1)")
        modelContext.insert(newTask)
    }
    
    func deleteTask(_ task: Task) { // delete
        modelContext.delete(task)
        // self.tasks.removeLast()
    }
    
    func toggleCompletion(for task: Task) { // update
        task.completed.toggle()
    }
}



#Preview {
    ContentView()
        .modelContainer(for: Task.self) // 프리뷰에서 Model 동작하도록
}
