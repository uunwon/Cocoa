//
//  BasicView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

struct BasicView: View {
    @State private var isOn = true //상태 저장 변수 추가 - 토글 버튼을 위한 ✨
    @State private var value = 0
    @State private var sliderValue = 0.5
    
    var body: some View {
        VStack { // Vertical 위아래
            Text("❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️")
                .padding(.bottom)
            
            Slider(value: $sliderValue, in: 0...1)
                .padding(.bottom)
                .accentColor(.red)
            
            Stepper("❤️‍🔥 Stepper value is \(value)", value: $value, in: 0...10)
                .padding([.leading, .bottom, .trailing], 30.0)
            
            Toggle("❤️‍🩹 Toggle message on/off", isOn: $isOn)
                .padding(.horizontal, 30.0)
                .tint(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            
            Text("Up")
                // add modifier
                .background(Color.red) // closer 이기에 가능한 생성자 변경 가능
                .padding(.vertical)
                .foregroundColor(Color.white)
                
            HStack { // Horizontal 양옆
                Text("Left")
                Text("Right")
            }
            .padding(.bottom)
            .fontWeight(.semibold)
            .foregroundColor(.gray) // foregroundStyle 라는 상위 개념이 있음
            
            ZStack {
                Text("Background")
                Text("Foreground")
            }
            .padding(.bottom)
            .foregroundColor(Color.red)
            
            
            Button("❤️‍🩹") {
                print("button1 click")
            }
            .font(.largeTitle)
            
            Button(action: {
                print("button2 click")
            }, label: {
                Text("❤️")
            })
        }
    }
}

#Preview {
    BasicView()
}
