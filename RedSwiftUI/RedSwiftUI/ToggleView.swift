//
//  ToggleView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ToggleView: View {
    @State var myToggle = true
    @State var newValue = 0
    @State var sliderValue = 0.0
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
                        
            Text("Toggle")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            // ✨ 토글 버튼 + 사각형 색상 변환
            Toggle(isOn: $myToggle) {
                Text(myToggle ? "Orange" : "Mint")
            }
            .padding()
            .foregroundColor(myToggle ? .orange : .mint)
            .tint(myToggle ? .orange : .mint)
            
            Rectangle()
                .frame(width: 500, height: 100)
                .foregroundColor(myToggle ? .orange : .mint)
            
            // ✨ 스테퍼: 사용자가 값을 증가시키거나 감소하며 세분화된 컨트롤
            Stepper(value: $newValue, in: 1...10) {
                Text("Stepper Value = \(newValue)")
            }
            .padding()
            .foregroundColor(myToggle ? .orange : .mint)
            
            // ✨ 슬라이더: 연속 값 범위 내 단일 값 선택하는 컨트롤
            Slider(value: $sliderValue, in: 1...50, step: 4)
                .padding()
                .tint(myToggle ? .orange : .mint)
            
            Text("Slider value = \(sliderValue)")
                .foregroundColor(myToggle ? .orange : .mint)
        }
    }
}

#Preview {
    ToggleView()
}
