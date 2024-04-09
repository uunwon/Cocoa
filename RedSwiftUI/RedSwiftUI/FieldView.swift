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

struct FieldView: View {
    @State private var message = ""
    
    var body: some View {
        VStack {
            TextField("❥ Placeholder text", text: $message)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled(true)
                .textContentType(.emailAddress)
                .submitLabel(.done)
                .padding()
            
            SecureField("❥ Password", text: $message)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

#Preview {
    FieldView()
}
