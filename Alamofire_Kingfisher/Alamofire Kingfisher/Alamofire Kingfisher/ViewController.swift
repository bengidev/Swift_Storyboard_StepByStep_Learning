//
//  ViewController.swift
//  Alamofire Kingfisher
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import Alamofire
import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    private let url = "https://jsonplaceholder.typicode.com/"
    
    private var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchData()
    }

    private func setupTableView() -> Void {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        tableView.register(UINib(nibName: "PhotosTableViewCell",
                                 bundle: Bundle(for: PhotosTableViewCell.self)),
                           forCellReuseIdentifier: "PhotosTableViewCell")
        
    }
    
    private func fetchData() -> Void {
        AF.request(url + "/photos", method: .get).responseDecodable(of: [Photo].self) { [weak self] response in
            if let photos = response.value {
                self?.photos = photos
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as? PhotosTableViewCell {
            cell.changePhotos(photos[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
}
