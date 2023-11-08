//
//  UIImageViewExtension.swift
//  Display Image Kingfisher
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import Foundation
import Kingfisher
import UIKit


extension UIImageView {
    func setImage(_ imageURL: String, placeholder: String? = "apple-logo") -> Void {
        kf.setImage(with: URL(string: imageURL), placeholder: UIImage(named: placeholder ?? "empty"))
    }
}
