//
//  CustomView.swift
//  Reusable Custom View
//
//  Created by Bambang Tri Rahmat Doni on 12/11/23.
//

import UIKit

@IBDesignable
final class CustomView: UIView {
    @IBOutlet private var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureView()
    }
    
    func changeTitleLabel(with value: String?) -> Void {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 1) {
                self?.titleLabel.text = value
            }
        }
    }
    
    private func configureView() -> Void {
        guard let view = self.loadViewFromNib(nibName: "CustomView") else { return }
        view.frame = bounds
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
        
        addSubview(view)
    }
}
