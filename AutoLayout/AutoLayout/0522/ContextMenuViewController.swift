//
//  ContextMenuViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/22/24.
//

import UIKit

class ContextMenuViewController: UIViewController, UIContextMenuInteractionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rectangle = UIView()
        rectangle.backgroundColor = .lightSalmon
        rectangle.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        
        view.addSubview(rectangle)
        
        let contextMenu = UIContextMenuInteraction(delegate: self)
        rectangle.addInteraction(contextMenu)
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in // 후행클로저
            let salmonAction = UIAction(title: "Salmon", image: nil) { _ in
                interaction.view?.backgroundColor = .lightSalmon
            }
            let mintAction = UIAction(title: "Mint", image: nil) { _ in
                interaction.view?.backgroundColor = .lightMint
            }
            let bananaAction = UIAction(title: "Banana", image: nil) { _ in
                interaction.view?.backgroundColor = .banana
            }
            let skyAction = UIAction(title: "Green", image: nil) { _ in
                interaction.view?.backgroundColor = .sky
            }
            
            let colorMenu = UIMenu(title: "Colors", options: .displayInline, children: [salmonAction, mintAction])
            let otherMenu = UIMenu(title: "Other", options: .displayInline, children: [bananaAction, skyAction])
            
            return UIMenu(title: "", children: [colorMenu, otherMenu])
        }
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configuration: UIContextMenuConfiguration, highlightPreviewForItemWithIdentifier identifier: any NSCopying) -> UITargetedPreview? {
        guard let view = interaction.view else { return nil }
        return UITargetedPreview(view: view)
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: any UIContextMenuInteractionCommitAnimating) {
        if let view = interaction.view {
            let transition = CATransition()
            transition.type = .fade
            transition.duration = 0.3
            view.layer.add(transition, forKey: nil)
        }
    }
    
}
