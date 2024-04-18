//
//  StackView.swift
//  DemoProject
//
//  Created by uunwon on 4/18/24.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        HStack {
            Text("Hello World, how are you?")
                .font(.largeTitle)
                .border(Color.black)
//                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300, alignment: .center)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    StackView()
}
