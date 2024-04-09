//
//  ToggleView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ToggleView: View {
    @State var myToggle = true
    @State var newValue = 0
    
    var body: some View {
        VStack {
            Image(systemName: "hare")
                .padding(.top)
                        
            Text("Toggle")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            Toggle(isOn: $myToggle) {
                Text(myToggle ? "Orange" : "Green")
            }
            .padding()
            .foregroundColor(myToggle ? .orange : .green)
            .tint(myToggle ? .orange : .green)
            
            Rectangle()
                .frame(width: 500, height: 100)
                .foregroundColor(myToggle ? .orange : .green)
            
            Stepper(value: $newValue, in: 1...10) {
                Text("Stepper Value = \(newValue)")
            }
            .padding()
            .foregroundColor(myToggle ? .orange : .green)
        }
    }
}

#Preview {
    ToggleView()
}
