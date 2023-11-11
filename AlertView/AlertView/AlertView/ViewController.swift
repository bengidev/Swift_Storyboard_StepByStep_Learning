//
//  ViewController.swift
//  AlertView
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func titlePressed(_ sender: UIButton) {
        showAlert(title: "Lorem Ipsum", okButtonTitle: "OK") { [weak self] (button) in
            self?.printButtonType(button)
        }
    }
    
    @IBAction func titleMessagePressed(_ sender: UIButton) {
        showAlert(title: "Lorem Ipsum",
                  message: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\n\n" +
                  "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...",
                  okButtonTitle: "OK") { [weak self] (button) in
            self?.printButtonType(button)
        }
    }
    
    @IBAction func okCancelPressed(_ sender: UIButton) {
        showAlert(title: "Lorem Ipsum",
                  message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore \n\n" +
                  "et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \n\n" +
                  "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\n" +
                  "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  okButtonTitle: "OK",
                  cancelButtonTitle: "Cancel") { [weak self] (button) in
            self?.printButtonType(button)
        }
    }
    
    @IBAction func okCancelDestructivePressed(_ sender: UIButton) {
        showAlert(title: "Lorem Ipsum",
                  message: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\n\n" +
                  "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...",
                  okButtonTitle: "OK",
                  cancelButtonTitle: "Cancel",
                  destructiveButtonTitle: "Destructive") { [weak self] (button) in
            self?.printButtonType(button)
        }
    }
    
    private func printButtonType(_ button: AlertViewActionType) -> Void {
        switch button {
        case .ok:
            print("OK Button was pressed!")
        case .cancel:
            print("Cancel Button was pressed!")
        case .destructive:
            print("Destructive Button was pressed!")
        }
    }
}

