//
//  PhotoDetailViewController.swift
//  Alamofire Kingfisher
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import UIKit

final class PhotoDetailViewController: UIViewController {
    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet private var photoTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateNavigationTitle("Photo Detail")
    }

    func updatePhotoDetail(_ photo: Photo) -> Void {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0) {
                self?.photoImageView.layer.cornerRadius = 10
                self?.photoImageView.setImage(photo.url)
                
                self?.photoTitleLabel.text = photo.title
            }
        }
    }
    
    private func updateNavigationTitle(_ value: String?) -> Void {
        title = value
    }
}
