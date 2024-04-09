//
//  ContentView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    @State var myDate = Date.now
    
    var body: some View {
        VStack {
            Text("Date Picker")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
                .padding(.top)
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
