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
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = 5
        imageView.image = UIImage(systemName: "pencil.slash")
        
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title Label"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Long Description Label\nLong Description Label\n"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageContentView)
        imageContentView.addSubview(imageView)
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
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
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageContentView.widthAnchor, multiplier: 0.9),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.centerXAnchor.constraint(equalTo: imageContentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContentView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageContentView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}

