//
//  ContentView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Title")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
        }
    }
}


#Preview {
    ContentView()
}


/*
 ✨ Swift 3.0 이전 프리뷰
 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }
 */
