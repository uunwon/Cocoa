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
                .padding(.bottom)
            
            
            // ✨ Alert
            Text("🂱")
            Button("Show Alert") {
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
            .padding(.bottom)
            
            
            // ✨ Action Sheet
            Text("🂲")
            Button("Show ActionSheet") {
                showAlert.toggle()
            }
            .confirmationDialog("Warning!", isPresented: $showAlert,
                                titleVisibility: .visible) {
                Button(role: .none) {
                    print("option1 action")
                } label: {
                    Text("option1")
                }
                
                Button(role: .destructive) {
                    print("option2 action")
                } label: {
                    Text("option2")
                }
            } message: {
                Text("Zombies on the loose")
            }
            .foregroundColor(.black)
        }
    }
}

#Preview {
    AlertView()
}
