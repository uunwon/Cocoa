//
//  SwitchViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/20/24.
//

import UIKit

class SwitchViewController: UIViewController {
    /*
        🍏 UISwitch ✨
        on/off 와 같은 두 가지 선택을 제공하는 UI 요소
     */
    
    let toggleSwitch = UISwitch()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "Switch is OFF"
        label.textAlignment = .center
        
        // 🍎 addTarget : 스위치 상태 변화에 반응하는 메서드 지정
        toggleSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        
        // 🍎 label 과 toggleSwitch 는 UIStackView 로 묶어 세로 배치
        let stackView = UIStackView(arrangedSubviews: [label, toggleSwitch])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            label.text = "Switch is ON"
        } else {
            label.text = "Switch is OFF"
        }
    }
}
