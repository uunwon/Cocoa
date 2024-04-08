//
//  PickerView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

struct PickerView: View {
    // @State private var selectedColor = Color.gray
    @State private var message = ""
    
    var body: some View {
        VStack (spacing: 28) {
            Text(message)
            Picker("Favorite Color", selection: $message, content: {
                Text("Happy").tag("happy") // tag modifier
                Text("Sad").tag("sad")
                Text("Bored").tag("bored")
            })
            .pickerStyle(SegmentedPickerStyle())
            // onChange 를 이용해 변화를 추적해서 메시지 전달함 ~
            .onChange(of: message) { newValue in
                switch newValue {
                case "happy": message = "Be happy and joyous"
                case "sad": message = "Life can be a struggle at times"
                case "bored": message = "Look for your purpose"
                default:
                    break
                }
            }
            
//            Rectangle().fill(selectedColor)
//            Picker("Favorite Color", selection: $selectedColor, content: {
//                Text("Red").tag(Color.red)
//                Text("Green").tag(Color.green)
//                Text("Blue").tag(Color.blue)
//            })
//            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

#Preview {
    PickerView()
}
