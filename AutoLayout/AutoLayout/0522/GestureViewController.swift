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
        rectangle2.frame = CGRect(x: 100 , y: 250, width: 175, height: 125)
        rectangle2.isUserInteractionEnabled = true
        
        let imageView = UIImageView(image: UIImage(systemName: "water.waves"))
        imageView.frame = CGRect(x:100, y: 400, width: 175, height: 125)
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(rectangle)
        view.addSubview(rectangle2)
        view.addSubview(imageView)
        
        /* TAP */
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        tapGesture.numberOfTapsRequired = 2 // 두번 누르면 tap, default 는 1번
        rectangle.addGestureRecognizer(tapGesture) // 뷰에 제스처를 붙힘
        
        /* Long Press */
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGesture))
        longGesture.minimumPressDuration = 2.0 // 길게 눌리는 시간
        rectangle2.addGestureRecognizer(longGesture)
        
        /* Pinch */
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture))
        imageView.addGestureRecognizer(pinchGesture)
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
    
    @objc func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale) // transform 은 뷰를 변형시키는- 그래피컬한 이펙트 들어감
        }
    }
    
}
