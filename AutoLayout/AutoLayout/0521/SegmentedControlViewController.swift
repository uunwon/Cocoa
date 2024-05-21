//
//  SegmentedControlViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/21/24.
//

// ✨ 루틴과 서브루틴 연관해서 공부해보기
// https://velog.io/@dombe/루틴과-서브루틴
// ✨ ALL About UIButton()
// https://hongssup.tistory.com/36

import UIKit

class SegmentedControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 🍎 기본 버튼 UIButton 부터 만들어볼거야
        let button = UIButton(type: .system)
        button.setTitle("CLICK ME", for: .normal) // normal 은 눌리지 않은 상태
        button.titleLabel?.font = UIFont(name: "font", size: 30) ??
            .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightSalmon
        button.layer.cornerRadius = 10 // 디자인에 대한 커스터마이징 할 때는 layer 사용 (줄어드는 추세지만! 아직은-)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        
        // 🍎 버튼이 더 독립적으로 운영되도록 추상적으로 config 로 이렇게 분리해서 애플이 만들어두는 거야
        // 버튼에 직접 위처럼 변경하지 않구 !!
        // config 객체는 재사용이 가능하다 (config 는 구조체임, 그래서 값 복사임 참조가 아니라)
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .dynamic
        button.layer.cornerRadius = 10
        
        config.title = "CLICK ME"
        config.baseBackgroundColor = .lightSalmon
        config.baseForegroundColor = .white
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        button.configuration = config
        // deprecated : button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
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
