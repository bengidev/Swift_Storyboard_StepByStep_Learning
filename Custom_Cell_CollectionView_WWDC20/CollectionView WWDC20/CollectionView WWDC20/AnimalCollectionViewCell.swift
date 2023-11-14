//
//  AnimalCollectionViewCell.swift
//  CollectionView WWDC20
//
//  Created by Bambang Tri Rahmat Doni on 14/11/23.
//

import UIKit

final class AnimalCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    
    private var animal: Animal?
    
    func configureView(_ animal: Animal) -> Void {
        self.animal = animal
        
        imageLabel.text = animal.image
        nameLabel.text = animal.name
    }

}
