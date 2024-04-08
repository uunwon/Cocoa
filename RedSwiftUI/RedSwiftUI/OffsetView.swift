//
//  OffsetView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/8/24.
//

import SwiftUI

struct OffsetView: View {
    var body: some View {
        VStack {
            
            ZStack {
                Text("Top")
                    .font(.system(size: 40))
                    .background(Color.green)
                Text("Top")
                    .font(.system(size: 40))
                    .background(Color.brown)
                    .position(x: 255, y: 127)
                Text("Top")
                    .font(.system(size: 40))
                    .background(Color.yellow)
                    .offset(x: 74, y: 125)
            }
            
            Text ("First")
                .font(.system(size: 40))
                .background(Color.pink)
            Text ("Second View")
                .font(.system(size: 40))
                .background(Color.pink)
        }
        
        // VStack offset 설정
        .offset(x: 25, y: 4)
    }
}

#Preview {
    OffsetView()
}
