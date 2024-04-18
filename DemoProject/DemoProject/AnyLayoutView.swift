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
        .transaction {
            $0.disablesAnimations = true
        }
        // $0 은 클로저 문법 in 앞에 오는 파라미터의 순서를 말함 ‼️
//        .transaction { transaction in
//            transaction.disablesAnimations = true
//        }
    }
}

#Preview {
    AnyLayoutView()
}
