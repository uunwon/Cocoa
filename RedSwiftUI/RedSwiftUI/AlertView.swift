//
//  AlertView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct AlertView: View {
    @State var showAlert = false
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
            
            Text("Alert")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            Button("Click Alert") {
                showAlert.toggle()
            }
            .alert("Warning!", isPresented: $showAlert) {
                Button(role: .cancel) {
                    print("button action")
                } label: {
                    Text("OK!")
                }
            } message: {
                Text("Zombies on the loose")
            }
            .foregroundColor(.black)
            .bold()
        }
    }
}

#Preview {
    AlertView()
}
