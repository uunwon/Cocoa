//
//  ButtonView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

struct ButtonView: View {
    @State var colorMe = true
    var body: some View {
        VStack {
            Rectangle()
                .fill(colorMe ? Color.black : Color.gray) // 삼항 연산자
                .frame(width: 500, height: 100)
                .padding(.top)
            
            Text("🐈‍⬛\nButton and Cat")
                .padding(.top, 50.0)
                .bold()
                .font(.custom("AmericanTypewriter", size: 24))
            
            Spacer()
            
            Button("Click here") {
                print("when you click 1")
            }
            .accentColor(Color.black)
            .bold()
            
            Button {
                print("when you click 2")
            } label : {
                Text("🐾")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .border(Color.black, width: 4)
            }
            .padding()
            
            Button {
                print("when you click 3")
            } label: {
                Image("sample_cat_square")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.brown, lineWidth: 4))
            }
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    ButtonView()
}
