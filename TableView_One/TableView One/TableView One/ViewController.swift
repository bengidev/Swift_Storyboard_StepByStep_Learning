//
//  ViewController.swift
//  TableView One
//
//  Created by Bambang Tri Rahmat Doni on 06/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected at: \(indexPath.item)")
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = animals[indexPath.item]
        
        return cell
    }
}
