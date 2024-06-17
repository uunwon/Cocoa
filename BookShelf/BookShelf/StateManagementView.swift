//
//  StateManagementView.swift
//  BookShelf
//
//  Created by uunwon on 6/17/24.
//
// 상태 관리 예제 이어 쓰기 🍀

import SwiftUI

struct StateManagementView: View { // ParentView
    // 🌵 @State 는 뷰가 소유한 값에 사용
    @State var favouriteNumber: Int = 42 // 상태 관리는 parentView
    
    var body: some View {
        VStack {
            Text("Your favourite number is \(favouriteNumber)")
            ChildView(number: $favouriteNumber)
        }
        .padding()
    }
}

struct ChildView: View { // ChildView
    // 🌵 @Binding 은 뷰 외부에서 소유한 값에 대한 참조
    @Binding var number: Int // Childview 에서는 그 수를 계속 올려주고 . .
    
    var body: some View {
        Stepper("\(number)", value: $number, in: 0...100)
    }
}

#Preview {
    StateManagementView()
}
