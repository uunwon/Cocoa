//
//  StackViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/20/24.
//

import UIKit

class StackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually // 가득 채우는데, 동등한 크기만큼
        
        let topLabel = UILabel()
        topLabel.text = "위"
        topLabel.textAlignment = .center
        topLabel.backgroundColor = .lightSalmon
        
        let leftLabel = UILabel()
        leftLabel.text = "왼"
        leftLabel.textAlignment = .center
        leftLabel.backgroundColor = .black
        
        let rightLabel = UILabel()
        rightLabel.text = "오"
        rightLabel.textAlignment = .center
        rightLabel.backgroundColor = .lightGray
        
        let hStackView = UIStackView(arrangedSubviews: [leftLabel, rightLabel]) // addSubView 같은 동작
        hStackView.axis = .horizontal
        hStackView.spacing = 10
        
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(hStackView)
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200), // 가로
            stackView.heightAnchor.constraint(equalToConstant: 100) // 세로
        ])
    }
    
}
