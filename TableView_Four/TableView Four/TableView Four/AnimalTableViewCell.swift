//
//  AnimalTableViewCell.swift
//  TableView Four
//
//  Created by Bambang Tri Rahmat Doni on 06/11/23.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    @IBOutlet var imageLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var animal: Animal? {
        didSet {
            imageLabel.text = animal?.image
            nameLabel.text = animal?.name
        }
    }
    
}
