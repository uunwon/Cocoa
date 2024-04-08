//
//  ImageView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            Capsule().fill(Color.yellow)
            Circle().fill(Color.black)
            Ellipse().fill(Color.brown)
            Rectangle().fill(Color.red)
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.green)
            
            Spacer()
            
            Ellipse().fill(
                RadialGradient(gradient: Gradient(colors:[.blue,.yellow]), center: .top, startRadius: 10, endRadius: 65))
            
            Spacer()
            
            Ellipse().fill(
                RadialGradient(gradient: Gradient(colors:[.blue,.yellow]), center: .center, startRadius: 10, endRadius: 65))
            
            Spacer()
            
            Ellipse().fill(
                AngularGradient(gradient: Gradient(colors: [.blue, .yellow]), center: .center))
            
            Spacer()
            
            Image(systemName: "tortoise.fill")
            Image(systemName: "tortoise.fill").font(.largeTitle)
            Image(systemName: "tortoise.fill").font(.custom("", size: 50))
            
            Spacer()
            
            Image("heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 50)
            
        }
    }
}

#Preview {
    ImageView()
}
