//
//  ViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         🍏 Auto Layout 사용 예시 ✨
         Auto Layout 은 제약 조건을 기반으로 뷰의 크기와 위치를 설정한다
         제약 조건은 뷰 간의 관계를 정의하고, 뷰의 크기와 위치를 동적으로 계산한다
        */
        let label = UILabel()
        label.text = "다시 만난 수입푸드 세계"
        
        // https://ios-development.tistory.com/1635
        // https://developer.apple.com/documentation/uikit/uiview/1622572-translatesautoresizingmaskintoco
        // "AutoResizingMask를 뷰의 제약으로 사용하지 않는다" == 다른 방법으로 제약을 사용할 것이다
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // 🍎 1번째 방식
//         label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = false
//         label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = false
        
        // ✨ safeAreaLayoutGuide: 화면 상단 상태바나 하단 홈 핸들에 겹치지 않는 영역으로 위치 시킬 때 사용하는 가이드라인
//        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
//        label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // 🍎 2번째 방식
        // 제약조건 하나하나 isActive 프로퍼티 설정하는 대신, activate 함수로 한 번에 활성화할 수 있다.
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
        
        
        
        
        
        
        /*
         🍏 제약 조건 설정하기 ✨
         */
        let box = UIView()
        box.backgroundColor = .systemPink
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        
        NSLayoutConstraint.activate([
            // 뷰의 크기를 설정한다
            box.widthAnchor.constraint(equalToConstant: 400),
            box.heightAnchor.constraint(equalToConstant: 3),
            
            box.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            box.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            box.widthAnchor.constraint(lessThanOrEqualToConstant: 200), // 최댓값
            box.heightAnchor.constraint(greaterThanOrEqualToConstant: 50) // 최솟값
        ])
        
        
        
        
        
        
        
        
        /*
         🍏 뷰 계층 구조 및 컨테이너 뷰 사용하기 (뷰 안에 뷰 안에 뷰 안에 뷰 안에) ✨
         */
        let containerView = UIView()
        containerView.backgroundColor = .black
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 200),
            containerView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let subview1 = UIView()
        subview1.backgroundColor = .systemPink
        subview1.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subview1)
        
        let subview2 = UIView()
        subview2.backgroundColor = .lightSalmon
        subview2.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subview2)
        
        NSLayoutConstraint.activate([
            subview1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            subview1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            subview1.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.66),
            subview1.heightAnchor.constraint(equalToConstant: 50),
            
            subview2.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            subview2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            subview2.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.33),
            subview2.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
