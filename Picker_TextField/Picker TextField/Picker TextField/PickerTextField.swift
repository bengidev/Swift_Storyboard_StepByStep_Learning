//
//  PickerTextField.swift
//  Picker TextField
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import UIKit

typealias PickerTextFieldDisplayNameHandler = ((Any) -> String)
typealias PickerTextFieldItemSelectionHandler = ((Int, Any) -> Void)

final class PickerTextField: UITextField {
    var pickerData = [Any]()
    var displayNameHandler: PickerTextFieldDisplayNameHandler?
    var itemSelectionHandler: PickerTextFieldItemSelectionHandler?
    
    private let pickerView = UIPickerView()
    private var lastSelectedRow = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureView()
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    
    private func configureView() -> Void {
        pickerView.delegate = self
        pickerView.dataSource = self
        inputView = pickerView
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: self,
                                          action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(self.doneButtonPressed))
        toolbar.setItems([spaceButton, doneButton], animated: true)
        
        inputAccessoryView = toolbar
    }
    
    private func updateText() -> Void {
        if lastSelectedRow > pickerData.count { return }
        
        let data = pickerData[lastSelectedRow]
        text = displayNameHandler?(data)
    }
    
    @objc private func doneButtonPressed() -> Void {
        updateText()
        resignFirstResponder()
    }
}

extension PickerTextField: UIPickerViewDelegate { 
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let data = pickerData[row]
        return  displayNameHandler?(data)
    }
}

extension PickerTextField: UIPickerViewDataSource { 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lastSelectedRow = row
        updateText()
        
        let data = pickerData[row]
        itemSelectionHandler?(row, data)
    }
}
