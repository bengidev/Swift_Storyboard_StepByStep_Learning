//
//  UIViewControllerExtension.swift
//  AlertView
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   okButtonTitle: String? = nil,
                   cancelButtonTitle: String? = nil,
                   destructiveButtonTitle: String? = nil,
                   completionHandler: ((AlertViewActionType) -> Void)? = nil) -> Void {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if okButtonTitle != nil {
            alertController.addAction(UIAlertAction(title: okButtonTitle, style: .default) { _ in
                completionHandler?(.ok)
            })
        }
                                      
        if cancelButtonTitle != nil {
            alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
                completionHandler?(.cancel)
            })
        }
        
        if destructiveButtonTitle != nil {
            alertController.addAction(UIAlertAction(title: destructiveButtonTitle, style: .destructive) { _ in
                completionHandler?(.destructive)
            })
        }
        
        present(alertController, animated: true, completion: nil)
    }
}
