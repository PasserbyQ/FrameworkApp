//
//  UIStoryboard.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func load<T:UIViewController>(name: String,controller: T.Type) -> T {
        
        let identifier = String(describing: type(of: controller))
        guard let vc = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("找不到。。。")
        }
        return vc
    }
}
