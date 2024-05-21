//
//  DatePickerViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/21/24.
//

import UIKit

// ✨ delegate 에 관하여 https://velog.io/@chagmn/Swift-Delegate
// ✨우 weak self vs unowned https://yudonlee.tistory.com/36
class DatePickerViewController: UIViewController {
    let datePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }() // 생성 시점에 완성되어야 해서 let

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 1
        let oneYearFromNow = Calendar.current.date(byAdding: dateComponents, to: today) // 오늘로부터 일년을 더한 캘린더를 리턴하는 값
        
        datePicker.minimumDate = today
        datePicker.maximumDate = oneYearFromNow
        
        /*
           // 🍎 1년 전으로 돌아갈 수 있음 - 과거 체크 !
         
            dateComponents.year = -1
            let oneYearAgo = Calendar.current.date(byAdding: dateComponents, to: today) // 오늘로부터 일년을 더한 캘린더를 리턴하는 값
            
            datePicker.minimumDate = oneYearAgo
            datePicker.maximumDate = today
         */
        
        datePicker.addAction(UIAction { [weak self] _ in
            print("sender: \(self?.datePicker.date.formatted() ?? "N/A")") // Not Acceptable
        }, for: .valueChanged) // valueChanged : 스크롤해서 바뀔 때마다 변경
        
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
