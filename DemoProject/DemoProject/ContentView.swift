//
//  ContentView.swift
//  DemoProject
//
//  Created by uunwon on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var fileopen: Bool = true
    
    var body: some View {
        var myString: String = "File closed"
        
        if(fileopen) {
            myString = "File opened"
        }
        
        // 표현식이 있는 경우 return 이 꼭 있어야 한다 (이게 원래 default)
        return VStack {
            HStack {
                Text(myString)
                    .padding()
                Text("Goodbye, World!")
            }
        }
    }
}

#Preview {
    ContentView()
}
