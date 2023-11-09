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
        
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
    
        updatePrimaryLabel(with: dataFromSecondView)
    }
    
    @IBAction private func secondViewPressed(_ sender: UIButton) {
        let secondStoryboard = UIStoryboard(name: "Second", bundle: nil)
        if let secondView = secondStoryboard.instantiateViewController(withIdentifier: "SecondStoryboard") as? SecondViewController {
            secondView.dataFromMainView = "This is from Main View"
            
            navigationController?.pushViewController(secondView, animated: true)
        }
    }
    
    func updatePrimaryLabel(with value: String?) -> Void {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 1) {
                self?.primaryLabel.text = value
            }
        }
    }
}

