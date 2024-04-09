//
//  ContextMenuView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContextMenuView: View {
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Context Menu")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
                .padding(.bottom, 40.0)
            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.customPink)
                .padding()
                .contextMenu { // 길게 누르면 동작
                    Button {
                        
                    } label: {
                        Label("Love with Schatzi", systemImage: "heart")
                    }
                    Button {
                        
                    } label: {
                        Label("Make Love", systemImage: "mappin")
                    }
                }
        }
    }
}

#Preview {
    ContextMenuView()
}
