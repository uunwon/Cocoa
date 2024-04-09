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
