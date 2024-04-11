//
//  ScrollView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ScrollView: View {
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Scroll View")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            ScrollView(.vertical, showIndicators: true) {
                ForEach(0..<50) {
                    Text("Item #\($0)")
                }
            }
        }
    }
}

#Preview {
    ScrollView()
}
