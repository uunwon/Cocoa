//
//  SpacerViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/20/24.
//

import UIKit

class SpacerViewController: UIViewController {
    /*
        🍏 Spacer ✨
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let labelLeft = UILabel()
        labelLeft.text = "왼쪽"
        labelLeft.backgroundColor = .lightSalmon
        
        let labelRight = UILabel()
        labelRight.text = "오른쪽"
        labelRight.backgroundColor = .lightSalmon
        
        let spacer = UIView()
        // 🍎 priority 를 low 로 설정함
        // 레이블이 최대한의 공간을 차지하도록 priority 를 낮춤
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        stackView.addArrangedSubview(labelLeft)
        stackView.addArrangedSubview(spacer)
        stackView.addArrangedSubview(labelRight)
        
        view.addSubview(stackView)
        
        // 🍎 제약조건
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // 바짝 붙은 게 아니라 16포인트를 떼준다 | safeAreaLayoutGuide 는 기기 돌리면 선 넘어버리니까 설정
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}
