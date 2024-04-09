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
        return calendar.date(from: startComponents)!
        ... // 범위 지정 1...10 처럼
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        VStack {
            Text("൹")
                .padding(.top)
            
            Text("Date Picker")
                .font(.custom("AmericanTypewriter", size: 24))
                .bold()
            
            Text("Chosen Date = \(myDate)")
                .padding()
            
            DatePicker(selection: $myDate, in: dateRange, displayedComponents: [.date], label: { Text("Date") })
                .datePickerStyle(.graphical)
                .padding()
                .tint(.black)
        }
    }
}

#Preview {
    DatePickerView()
}
