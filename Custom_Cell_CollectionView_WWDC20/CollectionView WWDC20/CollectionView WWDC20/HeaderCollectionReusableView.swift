//
//  HeaderCollectionReusableView.swift
//  CollectionView WWDC20
//
//  Created by Bambang Tri Rahmat Doni on 14/11/23.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet private var headerTitleLabel: UILabel!

    func changeHeaderTitle(with value: String?) -> Void {
        DispatchQueue.main.async { [weak self] in
            self?.headerTitleLabel.text = value
        }
    }
    
}
