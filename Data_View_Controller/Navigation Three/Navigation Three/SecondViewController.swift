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

    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        updatePrimaryLabel(with: dataFromMainView)
    }
    
    @IBAction private func mainViewPressed(_ sender: UIButton) {
        if let controllers = navigationController?.viewControllers {
            for (index, controller) in controllers.enumerated() where controller.isKind(of: SecondViewController.self) {
                if let mainView = controllers[index - 1] as? ViewController {
                    mainView.dataFromSecondView = "This is from Second View"
                    
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    private func updatePrimaryLabel(with value: String?) -> Void {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 1) {
                self?.primaryLabel.text = value
            }
        }
    }
}
