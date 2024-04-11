//
//  DisclosureGroupView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct DisclosureGroupView: View {
    @State var sliderValue = 0.0
    @State var message = ""
    @State var flag = true
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Disclosure Group")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            DisclosureGroup("🍔 Open here") {
                // ✨ 텍스트 message 로 받아오기
                Text("write something = \(message)")
                    .padding(.top)
                TextField("Type here", text: $message)
                    .padding()
                
                // ✨ 토글 버튼 on/off
                Text(flag ? "Toggle = true" : "Toggle = false")
                Toggle(isOn: $flag) {
                    Text("Toggle")
                }
                .tint(.black)
                .padding(.horizontal)
                .padding(.bottom)
                
                // ✨ 슬라이더 수 조절
                Text("The Slider Value = \(sliderValue)")
                Slider(value: $sliderValue, in: 0...15)
                    .padding()
            }
            .padding(40.0)
            .bold()
            .foregroundColor(.black)
        }
    }
}

#Preview {
    DisclosureGroupView()
}
