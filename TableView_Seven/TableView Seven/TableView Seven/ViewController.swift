//
//  ViewController.swift
//  TableView Seven
//
//  Created by Bambang Tri Rahmat Doni on 06/11/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    var dictionaries = [
        DictionaryPage(firstLetter: "A", list: [Animal(image: "🐜", name: "Ant")]),
        DictionaryPage(firstLetter: "B", list: [Animal(image: "🦇", name: "Bat"),
                                                Animal(image: "🦋", name: "Butterfly"),
                                               ]),
        DictionaryPage(firstLetter: "C", list: [Animal(image: "🐈", name: "Cat"),
                                                Animal(image: "🐪", name: "Camel"),
                                                Animal(image: "🦀", name: "Crab"),
                                               ]),
        DictionaryPage(firstLetter: "D", list: [Animal(image: "🦮", name: "Dog")]),
        DictionaryPage(firstLetter: "E", list: [Animal(image: "🦅", name: "Eagle")]),
        DictionaryPage(firstLetter: "F", list: [Animal(image: "🐟", name: "Fish")]),
        DictionaryPage(firstLetter: "G", list: [Animal(image: "🦒", name: "Giraffe"),
                                                Animal(image: "🐐", name: "Goat"),
                                                Animal(image: "🦍", name: "Gorilla"),
                                               ]),
        DictionaryPage(firstLetter: "H", list: [Animal(image: "🎠", name: "Horse")]),
        DictionaryPage(firstLetter: "M", list: [Animal(image: "🦧", name: "Monkey"),
                                                Animal(image: "🐁", name: "Mouse"),
                                               ]),
        DictionaryPage(firstLetter: "0", list: [Animal(image: "🦉", name: "Owl")]),
        DictionaryPage(firstLetter: "R", list: [Animal(image: "🐇", name: "Rabbit"),
                                                Animal(image: "🐀", name: "Rat"),
                                               ]),
        DictionaryPage(firstLetter: "S", list: [Animal(image: "🦂", name: "Scorpion")]),
        DictionaryPage(firstLetter: "T", list: [Animal(image: "🐅", name: "Tiger"),
                                                Animal(image: "🐢", name: "Turtle"),
                                               ]),
        DictionaryPage(firstLetter: "Z", list: [Animal(image: "🦓", name: "Zebra")]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() -> Void {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 44
        tableView.sectionFooterHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 44
        
        tableView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "AnimalTableViewCell")
        tableView.register(UINib(nibName: "AnimalTableViewHeaderFooterView", bundle: nil),
                           forHeaderFooterViewReuseIdentifier: "AnimalTableViewHeaderFooterView")
    }
}

extension ViewController: UITableViewDelegate { 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}

extension ViewController: UITableViewDataSource { 
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictionaries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionaries[section].list.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AnimalTableViewHeaderFooterView") as? AnimalTableViewHeaderFooterView {
            headerView.descriptionLabel.text = "\(dictionaries[section].firstLetter) - Header"
            
            return headerView
        }
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AnimalTableViewHeaderFooterView") as? AnimalTableViewHeaderFooterView {
            footerView.descriptionLabel.text = "\(dictionaries[section].firstLetter) - Footer"
            
            return footerView
        }
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as? AnimalTableViewCell {
            cell.animal = dictionaries[indexPath.section].list[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
}
