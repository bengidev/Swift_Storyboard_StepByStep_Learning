//
//  ViewController.swift
//  TableView Ten
//
//  Created by Bambang Tri Rahmat Doni on 07/11/23.
//

import UIKit

final class ViewController: UIViewController {
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row at: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionLike = UIContextualAction(style: .normal, title: "❤️\nLike") { action, view, completionHandler in
            print("Liked")
            completionHandler(true)
        }
        actionLike.backgroundColor = .systemGreen
        
        let actionRemove = UIContextualAction(style: .destructive, title: "Remove") { action, view, completionHandler in
            print("Removed")
            completionHandler(true)
        }
        actionRemove.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [actionRemove, actionLike])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionLeading = UIContextualAction(style: .normal, title: "Leading \nTest") { action, view, completionHandler in
            print("Leading Tested")
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [actionLeading])
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
        cell.textLabel?.text = animals[indexPath.row]
        
        return cell
    }
}
