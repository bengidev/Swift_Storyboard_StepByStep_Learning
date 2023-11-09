//
//  SecondViewController.swift
//  Navigation Three
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import UIKit

final class SecondViewController: UIViewController {
    var dataFromMainView: String?
    var delegate: SecondViewControllerDelegate?
    
    @IBOutlet private var primaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updatePrimaryLabel(with: dataFromMainView)
    }
    
    @IBAction private func mainViewPressed(_ sender: UIButton) {
        delegate?.dismissed("This String is from SecondViewControllerDelegate")
        navigationController?.popViewController(animated: true)
    }
    
    private func updatePrimaryLabel(with value: String?) -> Void {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 1) {
                self?.primaryLabel.text = value
            }
        }
    }
}
