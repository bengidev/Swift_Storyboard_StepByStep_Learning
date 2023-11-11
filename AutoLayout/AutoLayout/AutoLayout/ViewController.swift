//
//  ViewController.swift
//  AutoLayout
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var imageContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageContentView)
        
        setupLayout()
    }

    private func setupLayout() -> Void {
        NSLayoutConstraint.activate([
            imageContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageContentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageContentView.heightAnchor.constraint(equalTo: imageContentView.widthAnchor),
        ])
    }
}

