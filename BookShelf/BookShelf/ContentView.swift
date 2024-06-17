//
//  ContentView.swift
//  BookShelf
//
//  Created by uunwon on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var books: [Book] = Book.sampleBooks
    
    var body: some View {
        List(books) { book in
            HStack(alignment: .top) {
                Image(book.mediumCoverImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 90)
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text("by \(book.author)")
                        .font(.subheadline)
                    Text("\(book.pages) pages")
                        .font(.subheadline)
                }
                Spacer()
            }
        }
        .listStyle(.plain) // 라운딩되어있다가 플랫하게 펴짐 !
    }
}

#Preview {
    ContentView()
}

// 사이즈 딱 맞게 프리뷰 화면 보여주는 법 ✨
//#Preview(traits: .sizeThatFitsLayout) {
//    ContentView()
//}
