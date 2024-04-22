//
//  ContentView.swift
//  StorgeDemo
//
//  Created by uunwon on 4/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                SceneStorageView()
                    .tabItem {
                        Image(systemName: "circle.fill")
                        Text("SceneStorage")
                    }
                
                AppStorageView()
                    .tabItem {
                        Image(systemName: "square.fill")
                        Text("AppStorage")
                    }
            }
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
