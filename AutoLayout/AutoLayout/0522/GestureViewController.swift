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
        imageView.frame = CGRect(x:100, y: 410, width: 175, height: 125)
        imageView.isUserInteractionEnabled = true
        
        let imageView2 = UIImageView(image: UIImage(systemName: "fleuron"))
        // bounds 는 실측 사이즈 (화면에서 나타나는 나의 크기)
        imageView2.frame = CGRect(x: view.bounds.midX - 70, y: view.bounds.midY + 140, width: 125, height: 125)
        imageView2.tintColor = .lightMint
        imageView2.isUserInteractionEnabled = true
        
        view.addSubview(rectangle)
        view.addSubview(rectangle2)
        view.addSubview(imageView)
        view.addSubview(imageView2)
        
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
        
        /* Rotation */
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationGesture))
        imageView2.addGestureRecognizer(rotationGesture)
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
        guard let view = sender.view else { return }
        /*
         행렬과 매트리스
         그래픽스 행렬 연산 구몬 수학 . by 도율 🍏
         | a  b  0 |
         | c  d  0 |
         | tx ty 1 |
         */
        let currentScale = sqrt(view.transform.a * view.transform.a + view.transform.c * view.transform.c)
        if sender.scale < 1.0 { // 최소값
            if currentScale > 0.8 {
                // transform 은 뷰를 변형시키는- 그래피컬한 이펙트 들어감
                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            }
        } else {
            if currentScale < 1.2 { // 최댓값
                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            }
        }
    }
    
    @objc func rotationGesture(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
}
