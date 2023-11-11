//
//  ViewController.swift
//  DatePicker TextField
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var datePickerTextField: DatePickerTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDatePickerTextField()
    }

    private func configureDatePickerTextField() -> Void {
        datePickerTextField.setDateMode(.date)
        datePickerTextField.dateFormat = "MM/dd/yyyy"
        datePickerTextField.valueChanged = { date in
            print("DatePickerTextField value: \(date)")
        }
    }

}

