//
//  ContentView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

extension Color {
    static let myCustomColor2 = Color(red: 0.5, green: 0.8, blue: 0.3)
}

@available(iOS 15.0, *)
struct ContentView: View {
    @State private var message = ""
    @FocusState var dismissKeyboard: Bool
    
    var body: some View {
        VStack {
            Text("Text-Field")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
                .padding(.top)
            
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
    ContentView()
}


/*
 ✨ Swift 3.0 이전 프리뷰
 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }
 */
