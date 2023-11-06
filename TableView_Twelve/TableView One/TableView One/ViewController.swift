//
//  ViewController.swift
//  TableView One
//
//  Created by Bambang Tri Rahmat Doni on 06/11/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var searchBar: UISearchBar!
    
    private var animals = [
        "Cat",
        "Tiger",
        "Monkey",
        "Gorilla",
        "Dog",
        "Horse",
        "Camel",
        "Zebra",
        "Rat",
        "Rabbit",
        "Owl",
        "Butterfly",
        "Goat",
        "Crab",
        "Ant",
        "Scorpion",
        "Fish",
        "Turtle",
        "Eagle",
        "Bat",
        "Mouse",
        "Giraffe",
    ]
    
    private var filteredAnimals = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredAnimals = animals
        
        setupTableView()
        setupSearchBar()
    }

    private func setupTableView() -> Void {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupSearchBar() -> Void {
        searchBar.delegate = self
    }
}


extension ViewController: UITableViewDelegate { 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected at: \(indexPath.item)")
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredAnimals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = filteredAnimals[indexPath.item]
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search Text changed: \(searchText)")
        
        if searchText.isEmpty {
            filteredAnimals = animals
            tableView.reloadData()
        } else {
            filteredAnimals = animals.filter { return $0.localizedCaseInsensitiveContains(searchText) }
            tableView.reloadData()
        }
    }
}
