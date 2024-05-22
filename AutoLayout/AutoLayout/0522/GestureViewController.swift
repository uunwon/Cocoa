//
//  GestureViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/22/24.
//

import UIKit

class GestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rectangle = UIView()
        rectangle.backgroundColor = .banana
        rectangle.frame = CGRect(x: 100 , y: 100, width: 175, height: 125) // AutoLayout 안 쓰고 옛날 frame 방식으로-
        rectangle.isUserInteractionEnabled = true // 터치를 받을 수 있다 라는 속성
        
        let rectangle2 = UIView()
        rectangle2.backgroundColor = .banana
        rectangle2.frame = CGRect(x: 100 , y: 300, width: 175, height: 125)
        rectangle2.isUserInteractionEnabled = true
        
        view.addSubview(rectangle)
        view.addSubview(rectangle2)
        
        /* TAP */
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        tapGesture.numberOfTapsRequired = 2 // 두번 누르면 tap, default 는 1번
        rectangle.addGestureRecognizer(tapGesture) // 뷰에 제스처를 붙힘
        
        /* Long Press */
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGesture))
        longGesture.minimumPressDuration = 2.0 // 길게 눌리는 시간
        rectangle2.addGestureRecognizer(longGesture)
    }
    
    @objc func tapGesture(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            view.backgroundColor = (view.backgroundColor == .banana) ? .lightSalmon : .banana
        }
    }
    
    @objc func longGesture(_ sender: UITapGestureRecognizer) {
        if let view = sender.view, sender.state == .began {
            view.backgroundColor = (view.backgroundColor == .banana) ? .lightSalmon : .banana
        }
    }
    
}
