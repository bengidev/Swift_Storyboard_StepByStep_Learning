//
//  AlertPresenter.swift
//  CustomAlertView
//
//  Created by Bambang Tri Rahmat Doni on 14/11/23.
//

import Foundation
import SwiftMessages

final class AlertPresenter: NSObject, AlertPresenterProtocol {
    static let instance = AlertPresenter()
    
    private static let NibName = "CustomAlertView"
    
    func showAlert(title: String?, body: String?, okTitle: String?, cancelTitle: String?, handler: AlertHandler?) {
        showCustomAlert(title: title, body: body, okTitle: okTitle, cancelTitle: cancelTitle, handler: handler)
    }
    
    private func showSwiftMessagesAlert(title: String?, body: String?, okTitle: String?, cancelTitle: String?, handler: AlertHandler?) -> Void {
        let view = MessageView.viewFromNib(layout: .centeredView)
        view.configureTheme(.success)
        view.configureDropShadow()
        view.layoutMarginAdditions = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: nil) { _ in
            handler?(.ok)
            SwiftMessages.hide(animated: true)
        }
    }
    
    private func showCustomAlert(title: String?, body: String?, okTitle: String?, cancelTitle: String?, handler: AlertHandler?) -> Void {
        let nib = UINib(nibName: AlertPresenter.NibName, bundle: Bundle(for: AlertPresenter.self))
        guard let view = nib.instantiate(withOwner: self).first as? CustomAlertView else { return }
        
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
        view.configureAlert(title: title, body: body, okTitle: okTitle, cancelTitle: cancelTitle) { action in
            SwiftMessages.hide(animated: true)
            handler?(action)
        }
        
        var config = SwiftMessages.Config()
        config.presentationStyle = .center
        config.duration = .forever
        config.interactiveHide = false
        
        SwiftMessages.show(config: config, view: view)
    }
}
