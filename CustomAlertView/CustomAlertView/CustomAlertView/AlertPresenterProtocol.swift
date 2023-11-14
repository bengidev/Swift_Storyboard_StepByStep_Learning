//
//  AlertPresenterProtocol.swift
//  CustomAlertView
//
//  Created by Bambang Tri Rahmat Doni on 14/11/23.
//

import Foundation

typealias AlertHandler = ((AlertActionType) -> Void)

protocol AlertPresenterProtocol {
    func showAlert(title: String?, body: String?, okTitle: String?, cancelTitle: String?, handler: AlertHandler?) -> Void
}
