//
//  ScaleEffectView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ScaleEffectView: View {
    @State private var tempValue: CGFloat = 0
    @State private var finalValue: CGFloat = 1
    // CGFloat: 그래픽 처리할 때 쓰는 Float
    // CGPoint: 그래픽 처리할 때 쓰는 좌표(x,y) 값
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Scale Effect")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            Image(systemName: "heart.fill")
                .resizable()
                // .aspectRatio(contentMode: .fit) == scaledToFit
                .scaledToFit() // 부모 크기에 고정해 맞춰줌
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
                .scaleEffect(finalValue + tempValue)
                .gesture(
                    MagnificationGesture()
                        .onChanged{ amount in
                            tempValue = amount - 1
                        }
                        .onEnded { amount in
                            finalValue += tempValue
                            tempValue = 0
                            
                        }
                )
        }
    }
}

#Preview {
    ScaleEffectView()
}
