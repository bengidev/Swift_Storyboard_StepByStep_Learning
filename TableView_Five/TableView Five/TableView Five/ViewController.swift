//
//  ViewController.swift
//  TableView Five
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
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictionaries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionaries[section].list.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dictionaries[section].firstLetter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = dictionaries[indexPath.section].list[indexPath.row]
        
        return cell
    }
}
