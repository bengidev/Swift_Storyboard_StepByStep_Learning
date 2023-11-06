//
//  ViewController.swift
//  TableView Two
//
//  Created by Bambang Tri Rahmat Doni on 06/11/23.
//

import UIKit

class ViewController: UITableViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected animals: \(animals[indexPath.item])")
    }
    
    // MARK: TableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = animals[indexPath.item]
        
        return cell
    }
}

