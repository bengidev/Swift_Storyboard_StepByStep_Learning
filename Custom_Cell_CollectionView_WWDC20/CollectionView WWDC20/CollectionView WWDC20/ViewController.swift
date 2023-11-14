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
    
    private let animals = [Animal(image: "🐜", name: "Ant"),
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
        var config = UICollectionLayoutListConfiguration(appearance: .sidebar)
        config.headerMode = .supplementary
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = datasource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Animal>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(animals, toSection: .emoji)
        datasource.apply(snapshot)
    }
    
    private func configureDataSource() -> UICollectionViewDiffableDataSource<Section, Animal> {
        let cellNib = UINib(nibName: "AnimalCollectionViewCell", bundle: Bundle(for: AnimalCollectionViewCell.self))
        let cellRegistration = UICollectionView.CellRegistration(cellNib: cellNib) { (cell, indexPath, item: Animal) in
            (cell as? AnimalCollectionViewCell)?.configureView(item)
            if let cell = cell as? AnimalCollectionViewCell {
                cell.configureView(item)
            }
            
            if #available(iOS 16.0, *) {
                var contentConfiguration = cell.defaultBackgroundConfiguration()
            }
        }
        
        let headerNib = UINib(nibName: "HeaderCollectionReusableView", bundle: nil)
        let headerRegistration = UICollectionView.SupplementaryRegistration(supplementaryNib: headerNib, elementKind: UICollectionView.elementKindSectionHeader) { supplementaryView, elementKind, indexPath in
            if let view = supplementaryView as? HeaderCollectionReusableView {
                view.changeHeaderTitle(with: "Emojis")
            }
        }
        
        var dataSource = UICollectionViewDiffableDataSource<Section, Animal>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        dataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
        
        return dataSource
    }
}

