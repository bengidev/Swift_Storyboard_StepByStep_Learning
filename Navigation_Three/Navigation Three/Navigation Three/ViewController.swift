//
//  ViewController.swift
//  Navigation Three
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func secondViewPressed(_ sender: UIButton) {
        let secondStoryboard = UIStoryboard(name: "Second", bundle: nil)
        if let secondView = secondStoryboard.instantiateInitialViewController() as? SecondViewController {
            secondView.valueFromMainView = "This is from Main View"
            
            // This is for push View Controller into the Navigation Stack
            // with using the current NavigationController.
//            navigationController?.pushViewController(secondView, animated: true)
            
            // This is for push View Controller modally
            present(secondView, animated: true)
        }
    }
    
}

