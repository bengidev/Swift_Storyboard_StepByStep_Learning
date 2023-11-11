//
//  ViewController.swift
//  AlertView Two
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showActionSheetPressed(_ sender: UIButton) {
        showActionSheet(title: "Lorem Ipsum",
                        message: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\n\n" +
                        "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...",
                        okButtonTitles: ["Button 1", "Button 2", "Button 3"],
                        cancelButtonTitle: "Cancel") { button in
            switch button {
            case .ok(let number):
                print("Action Sheet OK Button: \(number) was pressed!")
            case .cancel:
                print("Action Sheet Cancel Button was pressed!")
            }
        }
    }
    
}

