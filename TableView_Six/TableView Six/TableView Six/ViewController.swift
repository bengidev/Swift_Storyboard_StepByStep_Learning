//
//  ViewController.swift
//  TableView Six
//
//  Created by Bambang Tri Rahmat Doni on 06/11/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    private var dictionaries = [
        DictionaryPage(firstLetter: "A", list: ["Ant"]),
        DictionaryPage(firstLetter: "B", list: ["Bat", "Butterfly"]),
        DictionaryPage(firstLetter: "C", list: ["Cat", "Camel", "Crab"]),
        DictionaryPage(firstLetter: "D", list: ["Dog"]),
        DictionaryPage(firstLetter: "E", list: ["Eagle"]),
        DictionaryPage(firstLetter: "F", list: ["Fish"]),
        DictionaryPage(firstLetter: "G", list: ["Giraffe", "Goat", "Gorilla"]),
        DictionaryPage(firstLetter: "H", list: ["Horse"]),
        DictionaryPage(firstLetter: "M", list: ["Monkey", "Mouse"]),
        DictionaryPage(firstLetter: "0", list: ["Owl"]),
        DictionaryPage(firstLetter: "R", list: ["Rabbit", "Rat"]),
        DictionaryPage(firstLetter: "S", list: ["Scorpion"]),
        DictionaryPage(firstLetter: "T", list: ["Tiger", "Turtle"]),
        DictionaryPage(firstLetter: "Z", list: ["Zebra"]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() -> Void {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        tableView.register(UINib(nibName: "DictionaryPageHeaderFooterView", bundle: nil),
                           forHeaderFooterViewReuseIdentifier: "DictionaryPageHeaderFooterView")
    }
}

extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictionaries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionaries[section].list.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DictionaryPageHeaderFooterView") as? DictionaryPageHeaderFooterView {
            headerView.headerTitleLabel.text = dictionaries[section].firstLetter
            
            return headerView
        }
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = dictionaries[indexPath.section].list[indexPath.row]
        
        return cell
    }
}
