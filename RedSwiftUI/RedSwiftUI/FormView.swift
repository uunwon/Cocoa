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
    @State var flag = false
    @State var message = ""
    
    var body: some View {
        
        VStack (spacing: 20) {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Form")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            // ✨ 섹션으로 나누어서 작성해보는 Form
//            Form {
//                Section {
//                    Text("This is Section has no header")
//                }
//                Section("Just a Header") { // header 는 대문자 변환
//                    Text("This Section uses a simple header")
//                }
//                Section {
//                    Text("This Section uses a simple footer")
//                } footer: {
//                    Text("Just a Footer")
//                }
//                Section {
//                    Text("This Section uses both a header and footer")
//                } header: {
//                    Text("The header")
//                } footer: {
//                    Text("The footer")
//                }
//            }
            
            Form {
                Text("This is a Form")
                Toggle(isOn: $flag, label: {
                    Text("Click me")
                })
            }
            
            GroupBox(label: Text("Group Box")) {
                Text("This is a Group Box")
                Toggle(isOn: $flag, label: {
                    Text("Click me")
                })
                TextField("Type here", text: $message)
            }
            
            // ✨ 사용자의 입력 정보를 서버로 보내는 Form
//            Form {
//                Text("This is the first Form")
//                TextField("Type here", text: $messageOne)
//            }
//            Form {
//                Text("This is the second Form")
//                TextField("Type here", text: $messageTwo)
//            }
//            Text("first form is \(messageOne)")
//                .bold()
//            Text("second form is \(messageTwo)")
//                .bold()
        }
    }
}

#Preview {
    FormView()
}
