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
        rectangle.frame = CGRect(x: 0 , y: 0, width: 1000, height: 1000) // AutoLayout 안 쓰고 옛날 frame 방식으로-
        rectangle.isUserInteractionEnabled = true // 터치를 받을 수 있다 라는 속성
        
        view.addSubview(rectangle)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.numberOfTapsRequired = 2 // 두번 누르면 tap, default 는 1번
        rectangle.addGestureRecognizer(tapGesture) // 뷰에 제스처를 붙힘
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            view.backgroundColor = (view.backgroundColor == .banana) ? .lightSalmon : .banana
        }
    }
    
}
