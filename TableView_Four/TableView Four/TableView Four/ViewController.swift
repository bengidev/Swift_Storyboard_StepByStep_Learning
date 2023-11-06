//
//  ViewController.swift
//  TableView Four
//
//  Created by Bambang Tri Rahmat Doni on 06/11/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    private var animals = [
        Animal(image: "🐈", name: "Cat"),
        Animal(image: "🐅", name: "Tiger"),
        Animal(image: "🦧", name: "Monkey"),
        Animal(image:"🦍", name: "Gorilla"),
        Animal(image: "🦮", name: "Dog"),
        Animal(image:"🎠", name: "Horse"),
        Animal(image: "🐪", name: "Camel"),
        Animal(image: "🦓", name: "Zebra"),
        Animal(image: "🐀", name: "Rat"),
        Animal(image: "🐇", name: "Rabbit"),
        Animal(image: "🦉", name: "Owl"),
        Animal(image: "🦋", name: "Butterfly"),
        Animal(image: "🐐", name: "Goat"),
        Animal(image: "🦀", name: "Crab"),
        Animal(image: "🐜", name: "Ant"),
        Animal(image: "🦂", name: "Scorpion"),
        Animal(image: "🐟", name: "Fish"),
        Animal(image: "🐢", name: "Turtle"),
        Animal(image: "🦅", name: "Eagle"),
        Animal(image: "🦇", name: "Bat"),
        Animal(image: "🐁", name: "Mouse"),
        Animal(image: "🦒", name: "Giraffe"),
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
        
        tableView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil
                                ), forCellReuseIdentifier: "AnimalTableViewCell")
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as? AnimalTableViewCell {
            cell.animal = animals[indexPath.item]
            return cell
        }
        
        return UITableViewCell()
    }
}

