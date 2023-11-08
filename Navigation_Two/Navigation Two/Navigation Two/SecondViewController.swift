//
//  SecondViewController.swift
//  Navigation Two
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import UIKit

final class SecondViewController: UIViewController {
    var valueFromMainView: String?
    
    @IBOutlet private var primaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updatePrimaryLabel(with: valueFromMainView)
    }
    
    private func updatePrimaryLabel(with value: String?) -> Void {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 1) {
                self?.primaryLabel.text = value
            }
        }
    }

}
