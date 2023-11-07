//
//  ViewController.swift
//  CollectionView One
//
//  Created by Bambang Tri Rahmat Doni on 07/11/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    
    private var animals = [
        "🐜", "🦇", "🦋", "🐈", "🐪", "🦀", "🦮", "🦅", "🐟",
        "🦒", "🐐", "🦍", "🎠", "🦧", "🐁", "🦉", "🐇",
        "🐀", "🦂", "🐅", "🐢", "🦓",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() -> Void {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate { 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected collection at: \(indexPath.row)")
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCell", for: indexPath) as? AnimalCollectionViewCell {
            cell.animalEmojiLabel.text = animals[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
