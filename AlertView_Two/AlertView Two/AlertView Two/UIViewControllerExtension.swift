//
//  UIViewControllerExtension.swift
//  AlertView Two
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import Foundation
import UIKit

extension UIViewController {
    func showActionSheet(title: String? = nil,
                         message: String? = nil,
                         okButtonTitles: [String]? = nil,
                         cancelButtonTitle: String? = nil,
                         completionHandler: ((ActionSheetViewActionType) -> Void)? = nil) -> Void {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        if let titles = okButtonTitles {
            for (index, item) in titles.enumerated() {
                alertController.addAction(UIAlertAction(title: item, style: .default) { _ in
                    completionHandler?(.ok(index))
                })
            }
        }
        
        if cancelButtonTitle != nil {
            alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
                completionHandler?(.cancel)
            })
        }
        
        present(alertController, animated: true, completion: nil)
    }
}
