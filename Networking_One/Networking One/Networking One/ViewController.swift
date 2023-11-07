//
//  ViewController.swift
//  Networking One
//
//  Created by Bambang Tri Rahmat Doni on 07/11/23.
//

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
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let responseData = data, let responseJson = try? JSONSerialization.jsonObject(with: responseData) {
                print("URLSession data result: \(String(describing: data))")
                print("URLSession response result: \(String(describing: responseJson))")
                print("URLSession error result: \(String(describing: error))")
            }
        }
        task.resume()
    }
    
    private func requestPOSTData(with urlString: String) -> Void {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["title": "POST Title", "body": "POST Body", "userId": "10"]
        if let httpBody = try? JSONSerialization.data(withJSONObject: body) {
            request.httpBody = httpBody
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let responseData = data, let responseJson = try? JSONSerialization.jsonObject(with: responseData) {
                print("URLSession data result: \(String(describing: data))")
                print("URLSession response result: \(String(describing: responseJson))")
                print("URLSession error result: \(String(describing: error))")
            }
        }
        task.resume()
    }
}

