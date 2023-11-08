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
        
        AF.request(urlString, method: .get).responseDecodable(of: [Post].self) { response in
            print("URLSession data result: \(String(describing: response.data))")
            print("URLSession response result: \(String(describing: response))")
            print("URLSession error result: \(String(describing: response.error))")
        }
    }
    
    private func requestPOSTData(with urlString: String) -> Void {
        guard let url = URL(string: urlString) else { return }
        
        let post = Post(postId: 0, title: "POST Title", body: "POST Body", userId: 10)
        
        AF.request(urlString, method: .post, parameters: post, encoder: JSONParameterEncoder.default).responseDecodable(of: Post.self) { response in
            print("URLSession data result: \(String(describing: response.data))")
            print("URLSession response result: \(String(describing: response))")
            print("URLSession error result: \(String(describing: response.error))")
        }
    }
}

