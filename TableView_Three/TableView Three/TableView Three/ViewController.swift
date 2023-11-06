//
//  ViewController.swift
//  TableView Three
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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
}

extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        var text = ""
        for _ in 0..<Int.random(in: 0..<10) {
            text += animals[indexPath.item] + " "
        }
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = text
        return cell
    }
}
