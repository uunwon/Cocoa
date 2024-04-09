//
//  StructView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct StructView: View {
    struct Animal: Identifiable {
        var id = UUID()
        var name: String
    }
    
    struct AnimalCategory: Identifiable {
        var id = UUID() // hasable 한 id
        // https://ko.wikipedia.org/wiki/범용_고유_식별자
        var category: String
        var animals: [Animal]
    }
    
    let categories = [
        AnimalCategory(category: "mammalia", animals: [Animal(name: "🐈‍⬛ Cat"), Animal(name: "🐩 Dog")]),
        AnimalCategory(category: "reptile", animals: [Animal(name: "🐢 Turtle"), Animal(name: "🦎 Lizard")])
    ]
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Struct")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            List {
                ForEach(categories, id: \.id) { c in // id: \.id 는 생략 가능
                    Section(header: Text(c.category)) {
                        ForEach(c.animals, id: \.id) { animal in
                            Text(animal.name)
                        }
                    }
                }
            }
            .bold()
        }
    }
}

#Preview {
    StructView()
}
