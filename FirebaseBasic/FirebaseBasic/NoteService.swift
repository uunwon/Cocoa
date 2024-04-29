//
//  NoteService.swift
//  FirebaseBasic
//
//  Created by uunwon on 4/29/24.
//

import Firebase
import FirebaseFirestore

class NoteService: ObservableObject {
    @Published var notes: [Note]
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    func fetch() {}
    
    func addNote(title: String, date: Date, body: String) {}

    // 실시간 데이터 업데이트할 때
    private func startRealtimeUpdates() {}
    
    private func updateNotes(snapshot: QuerySnapshot) {}
}
