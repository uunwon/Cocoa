//
//  GeometryReaderView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/12/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct GeometryReaderView: View {
    var body: some View {
        
        // ✨ Geometry Reader
        GeometryReader { geometry in
            VStack {
                Image(systemName: "hare")
                    .padding(.top, 20.0)
                
                Text("Geometry Reader")
                    .font(.custom("AmericanTypewriter", size: 24))
                    .bold()
                
                Divider() // 살짝 선도 그려줌
                
                Text("Width = \(geometry.size.width)")
                Text("Height = \(geometry.size.height)")
                
                Divider()
                
                Text("Local X origin = \(geometry.frame(in: .local).origin.x)")
                Text("Local Y origin = \(geometry.frame(in: .local).origin.y)")
                
                Divider()
                
                Text("Global X origin = \(geometry.frame(in: .global).origin.x)")
                Text("Global Y origin = \(geometry.frame(in: .global).origin.y)")
            }
        }
        .background(Color.yellow)
        // .ignoresSafeArea() // 정말 모든 공간을 사용할 수 있는
        
    }
}

#Preview {
    GeometryReaderView()
}
