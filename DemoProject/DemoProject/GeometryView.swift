//
//  GeometryView.swift
//  DemoProject
//
//  Created by uunwon on 4/18/24.
//

import SwiftUI

struct GeometryView: View {
    var body: some View {
        VStack (alignment: .center) {
            GeometryReader { geometry in
                Text("Hello World, how are you?")
                    .font(.largeTitle)
                    .border(Color.black)
                    .frame(minWidth: 0, maxWidth: geometry.size.width, minHeight: 0, maxHeight: geometry.size.height, alignment: .center)
            }
        }
    }
}

#Preview {
    GeometryView()
}
