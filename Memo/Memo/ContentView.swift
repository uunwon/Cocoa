//
//  ContentView.swift
//  Memo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI
import SwiftData

// Color 확장을 추가하여 16진수 문자열에서 Color 인스턴스를 생성하는 이니셜라이저 추가
extension Color {
    // hex 문자열에서 Color로 변환하는 이니셜라이저
    init(hex: String) {
        // hex 문자열을 UInt32로 변환합니다.
        var rgbValue: UInt32 = 0
        Scanner(string: hex).scanHexInt32(&rgbValue)
        
        // RGB 값을 추출하고 SwiftUI의 Color로 변환합니다.
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
    
    // Color를 hex 문자열로 변환하는 메서드
    func toHexString() -> String {
        // Color를 UIColor로 변환하여 컴포넌트를 가져옵니다.
        guard let components = UIColor(self).cgColor.components, components.count >= 3 else {
            return "000000" // 기본값은 검은색입니다.
        }
        
        // RGB 컴포넌트를 정수로 변환하고 hex 문자열로 조합하여 반환합니다.
        let red = Int(components[0] * 255.0)
        let green = Int(components[1] * 255.0)
        let blue = Int(components[2] * 255.0)
        
        return String(format: "%02X%02X%02X", red, green, blue)
    }
}


struct MemoAddView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var isSheetShowing: Bool
    
    @State var memoText: String
    @State var memoColorHex: String
    
    let colors: [Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancle") { isSheetShowing = false }
                Spacer()
                Button("Done") {
                    // ✨ 메모 추가하기
                    let newMemo = Memo(text: memoText, colorHex: memoColorHex, created: Date())
                    modelContext.insert(newMemo)
                    
                    isSheetShowing = false
                }.disabled(memoText.isEmpty)
            }
            
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button { memoColorHex = color.toHexString() } label: {
                        HStack {
                            Spacer()
                            if color.toHexString() == memoColorHex {
                                Image(systemName: "checkmark.circle")
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(color)
                        .shadow(radius: color.toHexString() == memoColorHex ? 8 : 0)
                    }
                }
            }
            
            Divider()
                .padding()
            
            TextField("Write anything you want . .", text: $memoText, axis: .vertical)
                .padding()
                .foregroundStyle(.white)
                .background(Color(hex: memoColorHex))
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
                    .tint(.salmon)
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(isSheetShowing: $isSheetShowing, memoText: "", memoColorHex: "")
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
