//
//  ViewController.swift
//  Navigation Two
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
        let secondNavigation = secondStoryboard.instantiateInitialViewController() as? UINavigationController
        if let secondView = secondNavigation?.viewControllers.first as? SecondViewController {
            secondView.valueFromMainView = "This is from Main View"
            navigationController?.pushViewController(secondView, animated: true)
        }
    }
    
}

