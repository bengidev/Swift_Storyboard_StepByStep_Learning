//
//  ViewController.swift
//  ContextualMenu WWDC20
//
//  Created by Bambang Tri Rahmat Doni on 14/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isToolbarHidden = false
        let trashAction = UIAction() { _ in print("Trask Action") }
        let destructiveAction = UIAction(title: "Destructive", attributes: .destructive) { _ in print("Destructive Action") }
        
        let menuAction = UIMenu(children: [
            destructiveAction,
            UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { _ in },
            UIAction(title: "Mail", image: UIImage(systemName: "envelope")) { _ in },
            UIAction(title: "Attach", image: UIImage(systemName: "paperclip")) { _ in },
            
        ])
        
        toolbarItems = [
            UIBarButtonItem(image: UIImage(systemName: "trash"), primaryAction: trashAction),
            UIBarButtonItem(systemItem: .trash, primaryAction: trashAction),
            .flexibleSpace(),
            UIBarButtonItem(image: UIImage(systemName: "list.number"), menu: menuAction),
        ]
        
        menuButton.menu = menuAction
        menuButton.showsMenuAsPrimaryAction = true
    }
}


