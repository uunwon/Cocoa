//
//  NavigationStackView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/11/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct NavigationStackView: View {
    @State var flag = true
    @State var message = ""
    
    var body: some View {
        NavigationStack {
            Image("sample_dog_square")
                .resizable()
                .frame(width: 400, height: 400)
                .aspectRatio(contentMode: .fill)
                .opacity(0.5)
            
            Text(message)
            
            Toggle(isOn: $flag, label: {
                Text("Toggle Display Mode")
            })
            .navigationTitle("Navigation Title")
            .navigationBarHidden(false) // 제목 가리기
            .navigationBarTitleDisplayMode(flag ? .inline : .large)
            .padding(.horizontal, 40.0)
            .tint(.black)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        message = "Click iCloud Icon"
                    } label: {
                        Image(systemName: "icloud.fill")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        message = "Click Done Text"
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
        .accentColor(.black)
        .padding(.top, 20.0)
    }
}

#Preview {
    NavigationStackView()
}
