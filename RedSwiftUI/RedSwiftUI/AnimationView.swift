//
//  AnimationView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct AnimationView: View {
    @State var move = true
    @State var changeMe = true
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Animation")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            Text("A Text View")
                .offset(x: move ? 100: 0, y: move ? 100 : 0)
                .animation(.default, value: move)
            
            Toggle(isOn: $move, label: {
                Text("Toggle me")
            })
            .tint(.black)
        }
        
        // ✨ Scale Effect
        Image(systemName: "tortoise.fill")
            .font(.system(size: 100))
            .foregroundStyle(.customWine)
            .scaleEffect(changeMe ? 1.75 : 1)
            .animation(.default, value: changeMe)
            .onTapGesture {
                changeMe.toggle()
            }
    }
}

#Preview {
    AnimationView()
}
