//
//  CircleButton.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/9/1.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit

@IBDesignable  class CircleButton: UIButton {

    @IBInspectable   var borderColor:UIColor = UIColor.clear {
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable   var borderWidth:CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable   var cornerRadius:CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
}
