//
//  ContentView.swift
//  Memo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI

// ✨ Memo 모델은 메모의 내용, 색상, 생성 날짜를 포함한다
struct Memo: Identifiable {
    var id: UUID = UUID()
    var text: String
    var color: Color
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
}

// MemoStore 클래스는 메모 목록을 관리, 메모 추가 및 삭제 기능을 제공한다
class MemoStore: ObservableObject {
    @Published var memos: [Memo] = []
    
    func addMemo(_ text: String, color: Color) {
        let memo: Memo = Memo(text: text, color: color, created: Date())
        memos.insert(memo, at: 0)
    }
    
    func removeMemo(_ targetMemo: Memo) {
        if let index = memos.firstIndex(where: { $0.id == targetMemo.id }) {
            memos.remove(at: index)
        }
    }
}

struct MemoAddView: View {
    var memoStore: MemoStore
    @Binding var isSheetShowing: Bool
    @Binding var memoText: String
    @Binding var memoColor: Color
    let colors: [Color]
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancle") { isSheetShowing = false }
                Spacer()
                Button("Done") {
                    memoStore.addMemo(memoText, color: memoColor)
                    isSheetShowing = false
                }.disabled(memoText.isEmpty)
            }
            
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button { memoColor = color } label: {
                        HStack {
                            Spacer()
                            if color == memoColor {
                                Image(systemName: "checkmark.circle")
                            }
                            Spacer()
                        }
                        .padding().frame(height: 50).foregroundStyle(.white).background(color).shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            
            Divider().padding()
            TextField("Write anything you want . .", text: $memoText, axis: .vertical).padding().foregroundStyle(.white).background(memoColor).shadow(radius: 3)
            Spacer()
        }.padding()
    }
}

struct ContentView: View {
    @ObservedObject var memoStore: MemoStore = MemoStore()
    
    @State var isSheetShowing: Bool = false
    @State var memoText: String = ""
    @State var memoColor: Color = .salmon
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        NavigationStack {
            List(memoStore.memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)").font(.title)
                        Text("\(memo.createdString)").font(.body).padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundStyle(.white)
                .background(memo.color)
                .shadow(radius: 3)
                .padding()
                .contextMenu {
                    ShareLink(item: memo.text)
                    Button { memoStore.removeMemo(memo) } label: {
                        Image(systemName: "slash.heart")
                        Text("Delete")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Memo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") { memoText = ""; isSheetShowing = true }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(memoStore: memoStore, isSheetShowing: $isSheetShowing, memoText: $memoText, memoColor: $memoColor, colors: colors)
            }
        }
    }
}

#Preview {
    ContentView()
}
