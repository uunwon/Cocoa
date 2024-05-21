//
//  PickerViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/21/24.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private lazy var pickerView: UIPickerView = {
       let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    let options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(pickerView)
        
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1 // 컴포넌트 안의 피커 개수
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        options.count
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    // 선택했을 때
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected row: \(row)")
    }
    
}
