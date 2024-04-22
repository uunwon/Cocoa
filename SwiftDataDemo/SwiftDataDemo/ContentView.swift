//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI

class Task: Identifiable {
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
    @State var tasks: [Task] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
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
                        Image(systemName: "plus")
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
        let newTask = Task(title: "🎀 Task no.\(tasks.count+1)")
        self.tasks.append(newTask)
    }
    
    func deleteTask() {
        self.tasks.removeLast()
    }
}



#Preview {
    ContentView()
}
