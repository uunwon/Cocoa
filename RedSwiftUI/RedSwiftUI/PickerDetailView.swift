//
//  PickerDetailView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct PickerDetailView: View {
    @State private var choice = 0.0
    @State private var myColor = Color.red
    @State var myDate = Date.now
    
    var body: some View {
        VStack {
            Text("Picker")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
                .padding(.top)
                .foregroundStyle(myColor)
            
            // ✨ Picker
            Picker(selection: $choice, label: Text("Picker")) {
                Text("Bird").tag(1.07)
                Text("Cat").tag(2.06)
                Text("Lizard").tag(3.41)
                Text("Dog").tag(4.13)
                Text("Hamster").tag(5.28)
            }
            .padding(.vertical)
            .pickerStyle(SegmentedPickerStyle())
            
            Text("You choose \(choice)\n")
                .italic()
                .foregroundStyle(myColor)
            
            // ✨ Color Picker
            ColorPicker("Pick a Color", selection: $myColor)
                .padding(.horizontal)
                .bold()
            
            Rectangle()
                .frame(width: 500, height: 30)
                .foregroundColor(myColor)
                .padding(.bottom)
            
            // ✨ Date Picker
            DatePicker(selection: $myDate, label: {Text("Date")})
                .datePickerStyle(.graphical)
                .padding(.bottom)
                .tint(myColor)
        }
    }
}

#Preview {
    PickerDetailView()
}
