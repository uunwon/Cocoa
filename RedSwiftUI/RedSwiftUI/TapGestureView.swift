//
//  TapGestureView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct TapGestureView: View {
    @State var changeMe1 = true
    @State var changeMe2 = true
    @State var changeMe3 = true
    @State var message = ""
    @State var myTouch = true
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Tap Gesture")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            // ✨ 탭 제스쳐
            Rectangle()
                .frame(width: 500, height: 100)
                .foregroundStyle(changeMe1 ? .black : .mint)
                .onTapGesture {
                    changeMe1.toggle()
                    myTouch = !myTouch
                }
            
            Rectangle()
                .frame(width: 500, height: 100)
                .foregroundStyle(changeMe2 ? .red : .green)
                .onTapGesture {
                    changeMe2.toggle()
                }
            
            Rectangle()
                .frame(width: 500, height: 100)
                .foregroundStyle(changeMe3 ? .teal : .yellow)
                // 👇🏻 제스처가 진행 중인 단계와 끝난 단계를 구현한 거
                .onLongPressGesture(minimumDuration: 1, maximumDistance: 2, pressing: { stillPressed in  // in 은 클로저
                    message = "Long press in progress: \(stillPressed)"
                }) {
                    
                    changeMe3.toggle()
                }
            
            Text(message).padding()
                .bold()
                .foregroundColor(myTouch ? .black : .mint)
        }
    }
}

#Preview {
    TapGestureView()
}
