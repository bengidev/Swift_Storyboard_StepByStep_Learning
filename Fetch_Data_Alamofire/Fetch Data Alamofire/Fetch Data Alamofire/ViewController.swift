//
//  ViewController.swift
//  Fetch Data Alamofire
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import Alamofire
import UIKit

class ViewController: UIViewController {

    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestGETData(with: baseURL + "/posts")
        requestPOSTData(with: baseURL + "/posts")
    }

    private func requestGETData(with urlString: String) -> Void {
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url, method: .get).response { response in
            if let responseData = response.data, let responseJson = try? JSONDecoder().decode([Post].self, from: responseData) {
                print("URLSession data result: \(String(describing: response.data))")
                print("URLSession response result: \(String(describing: responseJson))")
                print("URLSession error result: \(String(describing: response.error))")
            }
        }
    }
    
    private func requestPOSTData(with urlString: String) -> Void {
        guard let url = URL(string: urlString) else { return }
        
        let post = Post(postId: 0, title: "POST Title", body: "POST Body", userId: 10)
        if let httpBody = try? JSONEncoder().encode(post) {
            
            AF.request(url, method: .post, parameters: httpBody).response { response in
                print("URLSession data result: \(String(describing: response.data))")
                print("URLSession response result: \(String(describing: response))")
                print("URLSession error result: \(String(describing: response.error))")
            }
        }
    }
}

