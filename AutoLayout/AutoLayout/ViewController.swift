//
//  ViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/20/24.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

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
        imageView.tintColor = .banana
        imageView.isUserInteractionEnabled = true
        
        let imageView2 = UIImageView(image: UIImage(systemName: "fleuron"))
        // bounds 는 실측 사이즈 (화면에서 나타나는 나의 크기)
        imageView2.frame = CGRect(x: view.bounds.midX - 70, y: view.bounds.midY + 140, width: 125, height: 125)
        imageView2.tintColor = .banana
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
        
        /* Pan, 다중 Gesture */
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        imageView2.addGestureRecognizer(panGesture)
        
        rotationGesture.delegate = self
        panGesture.delegate = self
    }
    
    // UIGestureRecognizerDelegate 넣으면서 추가하는 함수 . . 단일 제스처 허용 여부
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            return true
        } else {
            return true
        }
    }
    
    // 복합 제스처 허용 여부
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
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
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            sender.setTranslation(.zero, in: view) // 아까 스케일 0으로 만든 것과 유사하게 다시 원위치로 . .
        }
    }
    
}
