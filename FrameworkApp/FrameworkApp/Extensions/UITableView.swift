//
//  UITableView.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(class cell: T.Type) {
        let identifier = String(describing: type(of: cell))
        register(cell.self, forCellReuseIdentifier: identifier)
    }
    
    func registerCell<T: UITableViewCell>(nib cell: T.Type) {
        let name = String(describing: type(of: cell))
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}
