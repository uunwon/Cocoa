//
//  DatePickerView.swift
//  RedSwiftUI
//
//  Created by uunwon on 4/9/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct DatePickerView: View {
    @State var myDate = Date.now
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 3, day: 25)
        let endComponents = DateComponents(year: 2024, month: 9, day: 13)
        return calendar.date(from: startComponents)! // 언래핑
        ... // 범위 지정 1...10 처럼
        calendar.date(from:endComponents)!
    }() // 괄호를 통해 선언부가 바로 실행이 가능해짐 - 마치 함수처럼
    
    let formatter = DateFormatter() // 날짜 정보를 문자열로 출력하기 위한 객체
    
    var body: some View {
        VStack {
            Text("൹")
                .padding(.top)
            
            Text("Date Picker")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            Text("Chosen Date = \(formatter.string(from:myDate))")
                .underline()
                .padding()
            
            DatePicker(selection: $myDate, in: dateRange, displayedComponents: [.date], label: { Text("Date") })
                .datePickerStyle(.graphical)
                .padding()
                .tint(.black)
            
        }.onAppear() {
            formatter.locale = Locale(identifier: "ko_KR")
            // formatter.dateStyle = .full
            formatter.dateStyle = .long
            formatter.timeStyle = .medium
        }
    }
}

#Preview {
    DatePickerView()
}
