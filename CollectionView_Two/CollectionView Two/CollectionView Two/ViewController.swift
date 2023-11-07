//
//  ViewController.swift
//  CollectionView Two
//
//  Created by Bambang Tri Rahmat Doni on 07/11/23.
//

import UIKit

final class ViewController: UICollectionViewController {
    
    private var animals = [
        "🐜", "🦇", "🦋", "🐈", "🐪", "🦀", "🦮", "🦅", "🐟",
        "🦒", "🐐", "🦍", "🎠", "🦧", "🐁", "🦉", "🐇",
        "🐀", "🦂", "🐅", "🐢", "🦓",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selecyed collection at: \(indexPath.row)")
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCell", for: indexPath) as? AnimalCollectionViewCell {
            cell.animalEmojiLabel.text = animals[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

