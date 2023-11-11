//
//  DatePickerTextField.swift
//  DatePicker TextField
//
//  Created by Bambang Tri Rahmat Doni on 11/11/23.
//

import UIKit

typealias DatePickerTextFieldDateChanged = ((Date) -> Void)

final class DatePickerTextField: UITextField {
    var valueChanged: DatePickerTextFieldDateChanged?
    var dateFormat: String = ""
    
    private let datePicker = UIDatePicker()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func setDateMode(_ mode: UIDatePicker.Mode) -> Void {
        datePicker.datePickerMode = mode
    }
    
    private func configureView() -> Void {
        inputView = datePicker
        datePicker.addTarget(self, action: #selector(self.dateValueChanged), for: .valueChanged)
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(self.doneButtonPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                         target: self,
                                         action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: true)
        
        inputAccessoryView = toolbar
    }
    
    private func updateText() -> Void {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        let date = datePicker.date
        text = dateFormatter.string(from: date)
        
    }
    
    @objc private func dateValueChanged() -> Void {
        updateText()
        valueChanged?(datePicker.date)
    }
    
    @objc private func doneButtonPressed() -> Void {
        updateText()
        resignFirstResponder()
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
}
