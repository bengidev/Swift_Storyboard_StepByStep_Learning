//
//  ViewController.swift
//  CollectionView WWDC20
//
//  Created by Bambang Tri Rahmat Doni on 12/11/23.
//

import UIKit

final class ViewController: UIViewController {
    private enum Section: CaseIterable {
        case emoji
    }
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var animals = [Animal(image: "🐜", name: "Ant"),
                           Animal(image: "🦇", name: "Bat"),
                           Animal(image: "🦋", name: "Butterfly"),
                           Animal(image: "🐈", name: "Cat"),
                           Animal(image: "🐪", name: "Camel"),
                           Animal(image: "🦀", name: "Crab"),
                           Animal(image: "🦮", name: "Dog"),
                           Animal(image: "🦅", name: "Eagle"),
                           Animal(image: "🐟", name: "Fish"),
                           Animal(image: "🦒", name: "Giraffe"),
                           Animal(image: "🐐", name: "Goat"),
                           Animal(image: "🦍", name: "Gorilla"),
                           Animal(image: "🎠", name: "Horse"),
                           Animal(image: "🦧", name: "Monkey"),
                           Animal(image: "🐁", name: "Mouse"),
                           Animal(image: "🦉", name: "Owl"),
                           Animal(image: "🐇", name: "Rabbit"),
                           Animal(image: "🐀", name: "Rat"),
                           Animal(image: "🦂", name: "Scorpion"),
                           Animal(image: "🐅", name: "Tiger"),
                           Animal(image: "🐢", name: "Turtle"),
                           Animal(image: "🦓", name: "Zebra"),
    ]
    
    private lazy var datasource: UICollectionViewDiffableDataSource<Section, Animal> = {
        return configureDataSource()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    private func configureCollectionView() -> Void {
        let config = UICollectionLayoutListConfiguration(appearance: .sidebar)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = datasource
        
        updateList()
    }
    
    private func updateList() -> Void {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Animal>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(animals, toSection: .emoji)
        datasource.apply(snapshot)
    }
    
    private func configureDataSource() -> UICollectionViewDiffableDataSource<Section, Animal> {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Animal> { cell, indexPath, itemIdentifier in
            var config = cell.defaultContentConfiguration()
            config.text = itemIdentifier.name
            config.secondaryText = itemIdentifier.image
            cell.contentConfiguration = config
        }
        
        return UICollectionViewDiffableDataSource<Section, Animal>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
    }
    
}
