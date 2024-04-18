//
//  AnyLayoutView.swift
//  DemoProject
//
//  Created by uunwon on 4/18/24.
//

import SwiftUI

struct AnyLayoutView: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        VStack {
            myLayout {
                Image(systemName: "goforward.10")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(systemName: "goforward.15")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        
        HStack {
            Button(action: {
                myLayout = AnyLayout(HStackLayout())
            }) {
                Text("HStack")
            }
            
            Button(action: {
                myLayout = AnyLayout(VStackLayout())
            }) {
                Text("VStack")
            }
        }
    }
}

#Preview {
    AnyLayoutView()
}
