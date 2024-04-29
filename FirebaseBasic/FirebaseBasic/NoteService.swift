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
    private let dbCollection = Firestore.firestore().collection("notes")
    private var listener: ListenerRegistration?
    
    init(notes: [Note] = []) {
        self.notes = notes
        startRealtimeUpdates() // 코드가 실행되면 실행해서 . .실시간 업뎃 되도록 ..
    }
    
    func fetch() {
        guard listener == nil else { return }
        dbCollection.getDocuments { [self] querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            updateNotes(snapshot: snapshot)
        }
    }
    
    // 노트를 추가하는 코드
    func addNote(title: String, date: Date, body: String) {
        let note = Note(id: UUID().uuidString, title: title, date: date, body: body)
        _ = try? dbCollection.addDocument(from: note)
        fetch()
    }

    // 실시간 데이터 업데이트할 때
    private func startRealtimeUpdates() {
        // listener 는 실시간 업데이트 .. 등록하는 거야 ..
        listener = dbCollection.addSnapshotListener { [self] querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            snapshot.documentChanges.forEach { diff in // 변경점에 대해 . .
                if (diff.type == .added) { // 도큐먼트가 추가됐다면
                    print("New note: \(diff.document.data())")
                }
                if (diff.type == .modified) {
                    print("Modified note: \(diff.document.data())")
                }
                if (diff.type == .removed) {
                    print("Removed note: \(diff.document.data())")
                }
            }
            updateNotes(snapshot: snapshot)
        }
    }
    
    private func updateNotes(snapshot: QuerySnapshot) {
        let notes: [Note] = snapshot.documents.compactMap { document in
            try? document.data(as: Note.self)
        }
        self.notes = notes.sorted {
            $0.date < $1.date // 앞에 오는 애가 작도록 정렬, 날짜 오름차순
        }
    }
}
