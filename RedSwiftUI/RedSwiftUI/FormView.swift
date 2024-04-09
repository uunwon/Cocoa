//
//  FormView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct FormView: View {
    @State var messageOne = ""
    @State var messageTwo = ""
    
    var body: some View {
        VStack (spacing: 20) {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Form")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            // ✨ 사용자의 입력 정보를 서버로 보내는 Form
            Form {
                Text("This is the first Form")
                TextField("Type here", text: $messageOne)
            }
            Form {
                Text("This is the second Form")
                TextField("Type here", text: $messageTwo)
            }
            Text("1️⃣ \(messageOne)")
                .bold()
            Text("2️⃣ \(messageTwo)")
                .bold()
        }
    }
}

#Preview {
    FormView()
}
