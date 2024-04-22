//
//  ContentView.swift
//  Memo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI
import SwiftData

// ✨ Memo 모델은 메모의 내용, 색상, 생성 날짜를 포함한다
@Model
class Memo {
    var id: UUID
    var text: String
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
    
    init(id: UUID = UUID(), text: String, created: Date) {
        self.id = id
        self.text = text
        self.created = created
    }
}

struct MemoAddView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var isSheetShowing: Bool
    
    @State var memoText: String
    @State var memoColor: Color
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancle") { isSheetShowing = false }
                Spacer()
                Button("Done") {
                    // ✨ 메모 추가하기
                    let newMemo = Memo(text: memoText, created: Date())
                    modelContext.insert(newMemo)
                    
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
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(color)
                        .shadow(radius: color == memoColor ? 8 : 0)
                    }
                }
            }
            
            Divider()
                .padding()
            
            TextField("Write anything you want . .", text: $memoText, axis: .vertical)
                .padding()
                .foregroundStyle(.white)
                .background(memoColor)
                .shadow(radius: 3)
            
            Spacer()
        }.padding()
    }
}

struct ContentView: View {
    @Query var memos: [Memo]
    @Environment(\.modelContext) var modelContext
    @State var isSheetShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            // ✨ 저장한 메모장 하나씩 출력하기
            List(memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)").font(.title)
                        Text("\(memo.createdString)").font(.body).padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundStyle(.white)
                // .background(memo.color)
                .shadow(radius: 3)
                .padding()
                
                // ✨ 꾹 놀렀을 때 추가 옵션으로 공유 및 삭제 기능
                .contextMenu {
                    ShareLink(item: memo.text)
                    // destructive 는 되돌리기 힘든 작업하는 버튼인걸 알려주는 애 ❤️‍🩹
                    Button(role: .destructive) {
                        deleteMemo(memo)
                    } label: {
                        Label("Delete", systemImage: "heart.slash")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Memo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetShowing = true
                    } label: {
                        Label("Add", systemImage: "arrow.up.heart.fill")
                    }
                    .foregroundStyle(.salmon)
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(isSheetShowing: $isSheetShowing, memoText: "", memoColor: .salmon)
            }
        }
    }
    
    // ✨ 메모 삭제하기
    func deleteMemo(_ memo: Memo) {
        modelContext.delete(memo)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self) // 프리뷰에서 Model 작동하도록
}
