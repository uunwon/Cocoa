//
//  ContentView.swift
//  BookShelf
//
//  Created by uunwon on 6/17/24.
//

import SwiftUI

struct BookListView: View {
    var books: [Book] = Book.sampleBooks
    
    var body: some View {
        List(books) { book in
            BookRowView(book: book)
        }
        .listStyle(.plain) // 라운딩되어있다가 플랫하게 펴짐 !
    }
}

#Preview {
    BookListView()
}

// 사이즈 딱 맞게 프리뷰 화면 보여주는 법 ✨
//#Preview(traits: .sizeThatFitsLayout) {
//    ContentView()
//}
