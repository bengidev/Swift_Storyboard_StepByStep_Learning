//
//  ViewController.swift
//  Navigation Three
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import UIKit

final class ViewController: UIViewController {
    var dataFromSecondView: String? = "Empty Data"

    @IBOutlet var primaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotificationObserver()
        
    }

    @IBAction private func secondViewPressed(_ sender: UIButton) {
        let secondStoryboard = UIStoryboard(name: "Second", bundle: nil)
        if let secondView = secondStoryboard.instantiateViewController(withIdentifier: "SecondStoryboard") as? SecondViewController {
            secondView.dataFromMainView = "This is from Main View"
            
            navigationController?.pushViewController(secondView, animated: true)
        }
    }
    
    private func updatePrimaryLabel(with value: String) -> Void {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 1) {
                self?.primaryLabel.text = value
                print(value)
            }
        }
    }
    
    private func setupNotificationObserver() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationDidReceive(_:)), name: NSNotification.Name("MainViewControllerNotification"), object: nil)
    }
    
    @objc private func notificationDidReceive(_ notification: Notification) -> Void {
        if let userInfo = notification.userInfo, let data = userInfo["DataFromSecondViewController"] as? String {
            updatePrimaryLabel(with: data)
        }
    }
}
