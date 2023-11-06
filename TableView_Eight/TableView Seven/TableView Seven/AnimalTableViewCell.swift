//
//  AnimalTableViewCell.swift
//  TableView Seven
//
//  Created by Bambang Tri Rahmat Doni on 06/11/23.
//

import UIKit

final class AnimalTableViewCell: UITableViewCell {
    @IBOutlet private var imageLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    
    var animal = Animal.example {
        didSet {
            imageLabel.text = animal.image
            nameLabel.text = animal.name
        }
    }
}
