//
//  SecondViewController.swift
//  Navigation Three
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import UIKit

final class SecondViewController: UIViewController {
    var dataFromMainView: String?
    
    @IBOutlet private var primaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updatePrimaryLabel(with: dataFromMainView)
    }
    
    @IBAction private func mainViewPressed(_ sender: UIButton) {
        setupPostNotification()
        
        navigationController?.popViewController(animated: true)
    }
    
    private func setupPostNotification() -> Void {
        NotificationCenter.default.post(name: NSNotification.Name("MainViewControllerNotification"), object: nil, userInfo: ["DataFromSecondViewController": "This Data is from SecondView NotificationCenter"])
    }
    
    private func updatePrimaryLabel(with value: String?) -> Void {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 1) {
                self?.primaryLabel.text = value
            }
        }
    }
}
