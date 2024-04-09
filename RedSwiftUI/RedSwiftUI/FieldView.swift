//
//  FieldView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

extension Color {
    static let myCustomColor1 = Color(red: 0.5, green: 0.8, blue: 0.3)
}

@available(iOS 15.0, *) // 15 이하 디바이스는 이 코드가 실행되지 않음
struct FieldView: View {
    @State private var message = ""
    @FocusState var dismissKeyboard: Bool // 포커스를 잃게 만드는 기능 (키보드가 내려가는)
    
    var body: some View {
        VStack {
            Text("Text-Field")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            TextField("❥ Placeholder text", text: $message)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled(true)
                .textContentType(.emailAddress)
                .submitLabel(.done)
                .padding()
                .focused($dismissKeyboard)
            
            SecureField("❥ Password", text: $message)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            TextEditor(text: $message)
            
            Button("Hide Keyboard") {
                dismissKeyboard = false
            }
            .accentColor(.black)
            .bold()
            .italic()
            .padding(.top)
        }
    }
}

#Preview {
    FieldView()
}
