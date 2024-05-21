//
//  SegmentedControlViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/21/24.
//

import UIKit

extension UIColor {
    func appropriateTintColor() -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        // 밝기 계산 (RGB to Luminance)
        let luminance = 0.299 * red + 0.587 * green + 0.114 * blue
        
        // 밝기가 0.5 이상이면 어두운 색 텍스트, 아니면 밝은 색 테스트
        return luminance > 0.5 ? UIColor.black : UIColor.white
    }
}

class SegmentedControlViewController: UIViewController {
    let segmentedControl = UISegmentedControl(items: ["Salmon", "Mint", "Black"])

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.selectedSegmentIndex = 0
        self.view.backgroundColor = .lightSalmon
        segmentedControl.addAction(UIAction { [weak self] _ in
            switch self?.segmentedControl.selectedSegmentIndex {
            case 0:
                self?.view.backgroundColor = .lightSalmon
            case 1:
                self?.view.backgroundColor = .lightMint
            case 2:
                self?.view.backgroundColor = .black
            default:
                break
            }
            self?.updatedColor()
        }, for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor), // 가운데 정렬
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)// 세로 정렬, 상태바 아래쪽으로 20 포인트
        ])
    }
    
    func updatedColor() {
        let tintColor: UIColor = (self.view.backgroundColor?.appropriateTintColor())!
        let normalTextAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: tintColor]
        self.segmentedControl.setTitleTextAttributes(normalTextAttribute, for: .normal)
    }

}
