//
//  UIView+Nib.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit

public extension UIView {
    
    class func loadNib(bundle : Bundle? = nil) -> UIView? {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}


