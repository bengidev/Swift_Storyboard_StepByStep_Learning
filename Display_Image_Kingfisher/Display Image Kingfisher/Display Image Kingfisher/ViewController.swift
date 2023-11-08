//
//  ViewController.swift
//  Display Image Kingfisher
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 10
        imageView.layer.backgroundColor = UIColor.lightGray.cgColor
        imageView.setImage("https://www.freepnglogos.com/uploads/mac-cosmetic-png-logo/apple-and-mac-os-logo-png-33.png")
    }
}

