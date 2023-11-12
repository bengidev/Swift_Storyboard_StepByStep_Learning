//
//  ViewController.swift
//  Reusable Custom View
//
//  Created by Bambang Tri Rahmat Doni on 12/11/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var firstCustomView: CustomView!
    @IBOutlet private var secondCustomView: CustomView!
    @IBOutlet private var thirdCustomView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateTitlePressed(_ sender: UIButton) {
        firstCustomView.changeTitleLabel(with: "First Custom View")
        secondCustomView.changeTitleLabel(with: "Second Custom View")
        thirdCustomView.changeTitleLabel(with: "Third Custom View")
    }
    
}
