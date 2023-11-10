//
//  UIImageViewExtension.swift
//  Alamofire Kingfisher
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func setImage(_ urlString: String) -> Void {
        kf.setImage(with: URL(string: urlString), placeholder: UIImage(named: "loading"))
    }
}
