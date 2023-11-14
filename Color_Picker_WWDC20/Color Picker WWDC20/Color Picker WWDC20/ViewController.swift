//
//  ViewController.swift
//  Color Picker WWDC20
//
//  Created by Bambang Tri Rahmat Doni on 14/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var colorView: UIView!
    @IBOutlet var colorLabel: UILabel!
    
    private var selectedColor = UIColor.systemGray
    
    private let colorPicker = UIColorPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureColorView()
        configureColorPicker()
    }
    
    @IBAction private func pickColorPressed(_ sender: UIButton) {
        present(colorPicker, animated: true, completion: nil)
    }
    
    private func configureColorView() -> Void {
        colorView.backgroundColor = selectedColor
        colorView.layer.cornerRadius = 10
        colorView.layer.shadowRadius = 10
        colorView.layer.shadowOpacity = 0.5
        
        colorLabel.text = "Select your favorite color!"
    }
    
    private func configureColorPicker() -> Void {
        colorPicker.delegate = self
        colorPicker.supportsAlpha = true
        colorView.backgroundColor =  colorPicker.selectedColor
    }
    
    private func updateColorView(with color: UIColor) -> Void {
        DispatchQueue.main.async { [weak self] in
            self?.colorView.backgroundColor = color
            self?.updateColorLabel(with: color.accessibilityName)
        }
    }
    
    private func updateColorLabel(with text: String?) -> Void {
        colorLabel.text = text?.uppercased()
    }
}

extension ViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        updateColorView(with: color)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        updateColorView(with: viewController.selectedColor)
    }
}
