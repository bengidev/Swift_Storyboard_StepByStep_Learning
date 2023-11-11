//
//  ViewController.swift
//  ViewController XIB
//
//  Created by Bambang Tri Rahmat Doni on 12/11/23.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func secondViewPressed(_ sender: UIButton) {
        let viewController = UIViewController(nibName: "SecondViewController", bundle: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

