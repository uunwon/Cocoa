//
//  SegmentedControlViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/21/24.
//

import UIKit

class SegmentedControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 🍎 기본 버튼 UIButton 부터 만들어볼거야
        let button = UIButton(type: .system)
        button.setTitle("Click ME", for: .normal) // normal 은 눌리지 않은 상태
        
        /* ✨ weak self 안 쓰는 건 : 이 클로저에 엑세스할 경우에 쓰면 되는 거야 ! !
         var count = 0
         button.addAction(UIAction { [weak self] _ in
                 self?.count += 1
                 print("Button was tapped ! \(self?.count ?? 0) ")
         }, for: .touchUpInside)
         */
        
        button.addAction(UIAction { _ in // 클로저 ..
                print("Button was tapped !")
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false // AutoLaylout 적용을 위해
        view.addSubview(button) // 화면 붙이기
        
        NSLayoutConstraint.activate([ // 제약조건 추가
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
