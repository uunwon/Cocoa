//
//  ListView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ListView: View {
    var myArray = ["Cat", "Dog", "Turtle", "Ferret", "Parrot", "Goldfish", "Lizard", "Canary", "Tarantula", "Hamster"]
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("List")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            List {
                Text("Cat")
                Text("Dog")
                Text("Sheep")
                Text("Bird")
            }
            
            List {
                // forEach 는 Foundation 에 정의됨
                // ForEach 는 View 를 뱉는 SwiftUI 구조
                // self 는 키 경로(key path)를 나타내는 특수한 문법으로, 컬렉션의 각 요소 자체를 의미한다. 즉, .self를 사용하면 컬렉션의 요소가 고유한 식별자 역할을 하게 된다!
                ForEach(1...25, id: \.self) { index in // key-value, keypath
                    Text("Animal #\(index)")
                }
            }
            
            List {
                ForEach(0...myArray.count - 1, id: \.self) { index in
                    Text(myArray[index])
                }
            }
        }
    }
}

#Preview {
    ListView()
}
