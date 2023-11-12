//
//  UIViewExtension.swift
//  Reusable Custom View
//
//  Created by Bambang Tri Rahmat Doni on 12/11/23.
//

import Foundation
import UIKit

extension UIView {
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self).first as? UIView
    }
}
