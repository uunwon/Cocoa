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
    let fontSize: CGFloat = 100.0
    
    @State var myDegrees: Double = 180.0
    @State var flag = false
    
    var body: some View {
        VStack (spacing: 50) {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Animation")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
                .padding(.bottom, 60.0)
            
//            Text("가라 피카츄 ⚡️")
//                .offset(x: move ? 100: 0, y: move ? 100 : 0)
//                .animation(.default, value: move)
//                .foregroundColor(.yellow)
//                .bold()
//            
//            Toggle(isOn: $move, label: {
//                Text("Toggle me")
//            })
//            .tint(.black)
        }
        
        // ✨ Scale Effect
//        Image(systemName: "tortoise.fill")
//            .font(.system(size: fontSize))
//            .foregroundStyle(.yellow)
//            .scaleEffect(changeMe ? 1.75 : 1)
//            .animation(.default, value: changeMe)
//            .onTapGesture {
//                changeMe.toggle()
//            }
//        
//        Spacer()
        
        // ✨ Rotation
//        Button("Animation now") {
//            flag.toggle()
//        }
//        .foregroundColor(.black)
//        
//        Slider(value: $myDegrees, in: -180...180, step: 1)
//            .padding()
//            .tint(.black)
//        
//        Text("✨ 빙 글 뱅 글 ❥")
//            .padding()
//            .rotationEffect(Angle(degrees: flag ? myDegrees : 0))
//            .animation(.default, value: flag)
//            .foregroundColor(.yellow)
//            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//            .bold()
//        
//        Spacer()
        
        Image(systemName: "tortoise.fill")
            .font(.system(size: 50))
            .foregroundStyle(.red)
            .scaleEffect(flag ? 1.75 : 1)
         // .animation(.default, value: flag)
        
        Image(systemName: "tortoise.fill")
            .font(.system(size: 50))
            .foregroundStyle(.red)
            .scaleEffect(flag ? 1.75 : 1)
         // .animation(.easeIn, value: flag)
        
        Image(systemName: "tortoise.fill")
             .font(.system(size: 50))
             .foregroundStyle(.red)
             .scaleEffect(flag ? 1.75 : 1)
         //  .animation(.easeIn, value: flag)
        
        Image(systemName: "tortoise.fill")
              .font(.system(size: 50))
              .foregroundStyle(.red)
              .scaleEffect(flag ? 1.75 : 1)
         //   .animation(.easeOut, value: flag)
        
        Image(systemName: "tortoise.fill")
              .font(.system(size: 50))
              .foregroundStyle(.red)
              .scaleEffect(flag ? 1.75 : 1)
         //   .animation(.easeInOut, value: flag)
        
        Button("Animation now") {
            // duration 으로 애니메이션 조절
            withAnimation(.easeInOut(duration: 2.1)) {
                flag.toggle()
            }
        }
        .foregroundColor(.black)
        .padding(.top)
    }
}

#Preview {
    AnimationView()
}
