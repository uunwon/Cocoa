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
        VStack {
            Image(systemName: "hare")
                .padding(.top, 20.0)
            
            Text("Geometry Reader")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            HStack {
                Text("Pushes to the right")
                
                // ✨ Geometry Reader
                GeometryReader { geometry in
                    VStack {
                        Image(systemName: "heart.fill")
                            .padding()
                        Text("Width = \(geometry.size.width)")
                        Text("Height = \(geometry.size.height)")
                        
                        Divider()
                        
                        Image(systemName: "heart.fill")
                            .padding()
                        Text("Local X origin = \(geometry.frame(in: .local).origin.x)")
                        Text("Local Y origin = \(geometry.frame(in: .local).origin.y)")
                        
                        Divider()
                        
                        Image(systemName: "heart.fill")
                            .padding()
                        Text("Global X origin = \(geometry.frame(in: .global).origin.x)")
                        Text("Global Y origin = \(geometry.frame(in: .global).origin.y)")
                        
                        Divider()
                        
                        Image(systemName: "heart.fill")
                            .padding()
                        Text("minX = \(geometry.frame(in: .local).minX)")
                        Text("midX = \(geometry.frame(in: .local).midX)")
                        Text("maxX = \(geometry.frame(in: .local).maxX)")
                        
                        Divider()
                        
                        Image(systemName: "heart.fill")
                            .padding()
                        Text("minY = \(geometry.frame(in: .local).minY)")
                        Text("midY = \(geometry.frame(in: .local).midY)")
                        Text("maxY = \(geometry.frame(in: .local).maxY)")
                    }
                    .foregroundStyle(Color.white)
                }
                .background(Color.indigo)
                // .ignoresSafeArea() // 정말 모든 공간을 사용할 수 있는
            }
            .background(Color.pink)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    GeometryReaderView()
}
