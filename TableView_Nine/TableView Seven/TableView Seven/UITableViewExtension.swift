//
//  UITableViewExtension.swift
//  TableView Seven
//
//  Created by Bambang Tri Rahmat Doni on 06/11/23.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(nibWithClass name: T.Type) -> Void {
        print("register UITableViewCell name: \(String(describing: name))")
        print("register UITableViewCell bundle: \(Bundle(for: T.self))")
        
        let nib = UINib(nibName: String(describing: name), bundle: Bundle(for: T.self))
        self.register(nib, forCellReuseIdentifier: String(describing: name))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        print("dequeueReusableCell name: \(String(describing: name))")
        
        if let cell = self.dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T {
            return cell
        }
        
        return T.init()
    }
    
    func register<T: UITableViewHeaderFooterView>(headerFooterViewWithClass name: T.Type) -> Void {
        print("register UITableViewHeaderFooterView name: \(String(describing: name))")
        print("register UITableViewHeaderFooterView bundle: \(Bundle(for: T.self))")
        
        let nib = UINib(nibName: String(describing: name), bundle: Bundle(for: T.self))
        self.register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T? {
        print("dequeueReusableHeaderFooterView name: \(String(describing: name))")
        
        return self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T
    }
}
