//
//  IconView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        VStack {
            Label("Make, iOS", systemImage: "heart.fill")
                .font(.title)
                .bold()
                .foregroundColor(Color.pink)
            
            Label {
                Text("we can go anywhere")
                    .italic()
            } icon: {
                Image("hug")
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
            }
        }
    }
}

#Preview {
    IconView()
}
