//
//  TabPracticeView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct TabPracticeView: View {
    @State var selectedView = 1
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("TabView")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            HStack {
                Button("1") {
                    selectedView = 1
                }
                Button("2") {
                    selectedView = 2
                }
                Button("3") {
                    selectedView = 3
                }
                Button("4") {
                    selectedView = 4
                }
                Button("5") {
                    selectedView = 5
                }
                Button("6") {
                    selectedView = 6
                }
            }
            
            TabView (selection: $selectedView) {
                Text("One")
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("One")
                    }.tag(1)
                Text("Two")
                    .tabItem {
                        Image(systemName: "hare.fill")
                        Text("Two")
                    }.tag(2)
                Text("Three")
                    .tabItem {
                        Image(systemName: "tortoise.fill")
                        Text("Three")
                    }.tag(3)
                Text("Four")
                    .tabItem {
                        Image(systemName: "folder.fill")
                        Text("Four")
                    }.tag(4)
                Text("Five")
                    .tabItem {
                        Image(systemName: "internaldrive.fill")
                        Text("Five")
                    }.tag(5)
                Text("Six") // 탭이 다섯개 넘어가면 More 로 넘어감
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Six")
                    }.tag(6)
            }
            .tabViewStyle(.page) // page 처럼 화면 넘어감
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // 탭뷰가 아래 인디케이터로 귀엽게 나옴
            .bold()
            .tint(.customPink)
        }
    }
}

#Preview {
    TabPracticeView()
}
