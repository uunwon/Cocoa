//
//  ContentView.swift
//  DemoProject
//
//  Created by uunwon on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Text 1")
                Text("Text 2")
                
                MyHStackView()
            }
            Text("Text 5")
        }
    }
}

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("Text 3")
            Text("Text 4")
        }
    }
}

#Preview {
    ContentView()
}
