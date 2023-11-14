//
//  ViewController.swift
//  CustomAlertView
//
//  Created by Bambang Tri Rahmat Doni on 14/11/23.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func showCustomAlertPressed(_ sender: UIButton) {
        AlertPresenter.instance.showAlert(title: "Title", body: "Body", okTitle: "OK", cancelTitle: "Cancel") { action in
            print("Show Custom Alert was pressed with action: \(action)")
        }
    }
    
}

