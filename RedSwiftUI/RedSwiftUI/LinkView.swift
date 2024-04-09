//
//  LinkView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

extension Color {
    static let myCustomColot3 = Color(red: 0.5, green: 0.8, blue: 0.3)
}

@available(iOS 15.0, *)
struct LinkView: View {
    @State var message = ""
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Link")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            Menu("Options") {
                Button("Open", action: openFile)
                Button("Find", action: findFile)
                Button("Delete...", action: deleteFile)
            }
            .menuStyle(DefaultMenuStyle())
            .menuOrder(.fixed) // 메뉴 순서 고정
            .foregroundColor(.black)
            
            Text("✨ \(message) ✨").padding()
                .bold()
                .foregroundColor(.mint)
            
            Link(destination: URL(string: "https://www.apple.com")!,
                 label: { Text("Apple") })
            .foregroundColor(.black)
        }
    }
    
    func openFile() {
        message = "Open chosen"
    }
    
    func findFile() {
        message = "Find chosen"
    }
    
    func deleteFile() {
        message = "Delete chosen"
    }
}

#Preview {
    LinkView()
}
