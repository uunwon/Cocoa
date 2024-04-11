//
//  ScrollPracticeView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ScrollPracticeView: View {
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Scroll View")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            ScrollView(Axis.Set.vertical, showsIndicators: true) {
                ForEach(0..<50) {
                    Text("Item #\($0)")
                }
            }
        }
    }
}

#Preview {
    ScrollPracticeView()
}
