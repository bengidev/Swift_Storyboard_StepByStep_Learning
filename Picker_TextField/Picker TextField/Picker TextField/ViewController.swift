//
//  ViewController.swift
//  Picker TextField
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var pickerTextField: PickerTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePickerTextField()
    }
    
    private func configurePickerTextField() -> Void {
        pickerTextField.pickerData = ["1", "2", "3", "4", "5"]
        pickerTextField.displayNameHandler = { item in
            return item as? String ?? "Empty"
        }
        pickerTextField.itemSelectionHandler = { (index, item) in
            print("Item selected at: \(index)")
            print("Item contained: \(item)")
        }
    }
}

