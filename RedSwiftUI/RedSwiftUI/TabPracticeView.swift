//
//  TabPracticeView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct TabPracticeView: View {
    var body: some View {
        Image(systemName: "hare")
            .padding(.top)
        
        Text("TabView")
            .font(.custom("AmericanTypewriter", size: 24))
            .bold()
        
        TabView {
            Text("One")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("One")
                }
            Text("Two")
                .tabItem {
                    Image(systemName: "hare.fill")
                    Text("Two")
                }
            Text("Three")
                .tabItem {
                    Image(systemName: "tortoise.fill")
                    Text("Three")
                }
            Text("Four")
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("Four")
                }
            Text("Five")
                .tabItem {
                    Image(systemName: "internaldrive.fill")
                    Text("Five")
                }
            Text("Six") // 탭이 다섯개 넘어가면 More 로 넘어감
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Six")
                }
        }
        .bold()
        .tint(.customPink)
        // .accentColor(.purple)
    }
}

#Preview {
    TabPracticeView()
}
