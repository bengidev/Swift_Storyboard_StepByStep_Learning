//
//  PhotosTableViewCell.swift
//  Alamofire Kingfisher
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    @IBOutlet private var photosImageView: UIImageView!
    @IBOutlet private var photosTitleLabel: UILabel!
    
    func changePhotos(_ photo: Photo) -> Void {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 1) {
                self?.photosTitleLabel.text = photo.title
                self?.photosImageView.setImage(photo.url)
            }
        }
    }
}
