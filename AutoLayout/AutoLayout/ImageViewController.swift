//
//  ImageViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/20/24.
//

import UIKit

class ImageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         /*
            🍏 원 그리기 ✨
         */
        let circleView = UIView()
        circleView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        circleView.backgroundColor = .yellow
        
        circleView.layer.cornerRadius = 50 // 네모를 깎아버렸다 -> 원형됨
        circleView.layer.borderWidth = 2 // 테두리 2만큼
        
        circleView.layer.borderColor = UIColor.black.cgColor // UIColorc 도 한 꺼풀 벗김
        self.view.addSubview(circleView)
        
        
         /*
            🍏 사각형 그리기 ✨
         */
        let squareView = UIView()
        squareView.frame = CGRect(x: 220, y: 100, width: 100, height: 100) // (계측 크기)
        squareView.backgroundColor = .blue
        
        
        /*
           🍏 그라디언트 == 보까시 ✨
        */
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = squareView.bounds // bounds 는 frame 과 상응한다 (실측 크기)
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        squareView.layer.insertSublayer(gradientLayer, at: 0) // 0번=제일 첫번째 레이어에 추가시킴 ~
        
        view.addSubview(squareView)
        
        
        /*
           🍏 이미지 ✨
        */
        let imageView = UIImageView(image: UIImage(systemName: "hare.fill"))
        imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        imageView.tintColor = .purple // 강조 색
        imageView.contentMode = .scaleAspectFit // 크기 영역에 맞춰지는, 깨지지 않는
        self.view.addSubview(imageView)
        
        let flagImageView = UIImageView(image: UIImage(systemName: "flag"))
        flagImageView.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        flagImageView.clipsToBounds = true // 위아래가 차니까 다른 곳이 넘쳐흐른 ..
        flagImageView.contentMode = .scaleToFill // 넘쳐흘러도 가득 채워
        self.view.addSubview(flagImageView)
        
    }
}
