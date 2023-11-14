//
//  CustomAlertView.swift
//  CustomAlertView
//
//  Created by Bambang Tri Rahmat Doni on 14/11/23.
//

import UIKit

class CustomAlertView: UIView {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var bodyLabel: UILabel!
    @IBOutlet private var okButton: UIButton!
    @IBOutlet private var cancelButton: UIButton!
    
    private var alertHandler: AlertHandler?
    
    
    func configureAlert(title: String?, body: String?, okTitle: String?, cancelTitle: String?, handler: AlertHandler?) -> Void {
        titleLabel.text = title
        bodyLabel.text = body
        okButton.titleLabel?.text = okTitle
        cancelButton.titleLabel?.text = cancelTitle
        alertHandler = handler
    }
    
    @IBAction private func okButtonPressed(_ sender: UIButton) {
        alertHandler?(.ok)
    }
    
    @IBAction private func cancelButtonPressed(_ sender: UIButton) {
        alertHandler?(.cancel)
    }
}
