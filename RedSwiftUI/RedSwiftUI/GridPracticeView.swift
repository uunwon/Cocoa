//
//  GridPracticeView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct GridPracticeView: View {
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Grid")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            let gridItems = [GridItem(.fixed(50)), GridItem(.fixed(50)), GridItem(.fixed(50))]
            
            // showsIndicators = 가로(horizontal) 스크롤
            ScrollView(Axis.Set.horizontal, showsIndicators: true) {
                LazyHGrid(rows: gridItems) {
                    Image(systemName: "1.circle")
                    Image(systemName: "2.circle")
                    Image(systemName: "3.circle")
                    Image(systemName: "4.circle")
                    Image(systemName: "5.circle")
                    Image(systemName: "6.circle")
                    Image(systemName: "7.circle")
                    Image(systemName: "8.circle")
                    Image(systemName: "9.circle")
                    Image(systemName: "10.circle")
                }
                .font(.largeTitle)
            }
            
            ScrollView(Axis.Set.vertical, showsIndicators: true) {
                LazyVGrid(columns: gridItems) {
                    Image(systemName: "1.square")
                    Image(systemName: "2.square")
                    Image(systemName: "3.square")
                    Image(systemName: "4.square")
                    Image(systemName: "5.square")
                    Image(systemName: "6.square")
                    Image(systemName: "7.square")
                    Image(systemName: "8.square")
                    Image(systemName: "9.square")
                    Image(systemName: "10.square")
                }
                .font(.largeTitle)
            }
        }
    }
}

#Preview {
    GridPracticeView()
}
