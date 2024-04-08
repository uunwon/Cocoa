//
//  TextView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        let myString = "Displays a string varibale"
        
        Text("❥Daily Text 🗞️")
            .font(.custom("AmericanTypewriter", size: 30))
            .bold()
            .padding()
        
        Text("This is my age \(myString). Since I am retired, I am now eligible for a pension and Social Security so I can spend the rest of my life relaxing and enjoying life without having to work for an income anymore.")
            .multilineTextAlignment(.leading)
            .truncationMode(.tail)
            .lineLimit(10)
            .padding([.leading, .bottom, .trailing], 30.0)
        
        Spacer()
        
        Text("Bold")
            .font(.title)
            .bold()
        
        Text("Italic")
            .font(.title2)
            .italic()
        
        Text("Underlined")
            .font(.headline)
            .underline()
        
        Text("Strikethrough")
            .font(.subheadline)
            .strikethrough()
        
        Text("Custom Font American")
            .font(.custom("AmericanTypewriter", size: 24))
        
        Text("Line Spacing")
            .font(.body)
            .lineSpacing(10)
            .padding(.bottom, 30.0)
    }
}

#Preview {
    TextView()
}
