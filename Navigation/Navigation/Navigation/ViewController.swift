//
//  ViewController.swift
//  Navigation
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let secondView = segue.destination as? SecondViewController {
//            secondView.valueFromFirstView = "Test From First View"
//        }
        
        if let secondView = segue.destination as? SecondViewController, 
            let data = sender as? UIButton {
            secondView.valueFromFirstView = data.titleLabel?.text
        }
    }
    
    @IBAction private func secondViewPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "secondViewSegue", sender: sender)
    }
    
}

