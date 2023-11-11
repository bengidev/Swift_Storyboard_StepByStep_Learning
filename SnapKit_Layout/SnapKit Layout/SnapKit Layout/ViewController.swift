//
//  ViewController.swift
//  SnapKit Layout
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    private lazy var imageViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOpacity = 0.5
        imageView.image = UIImage(systemName: "pencil.slash")
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Title Label"
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Long Description Label\nLong Description Label\n"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageViewContainer)
        imageViewContainer.addSubview(imageView)
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        setupLayout()
    }
    
    private func setupLayout() -> Void {
        imageViewContainer.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.width.equalToSuperview()
            make.height.equalTo(imageViewContainer.snp.width)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(imageViewContainer.snp.width).multipliedBy(0.9)
            make.height.equalTo(imageView.snp.width)
            make.center.equalTo(imageViewContainer.snp.center)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageViewContainer.snp.bottom).inset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).inset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
}

