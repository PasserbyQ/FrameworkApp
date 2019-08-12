//
//  UIColor+Ext.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
     *  16进制获取颜色
     */
    private convenience init(red: Int, green: Int, blue: Int, al: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: al)
    }
    
    public convenience init(_ netHex:Int, _ alpha: CGFloat = 1.0) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff, al: alpha)
    }
    
   
    /**************************自定义色值*********************/
    
    class var global: UIColor {
        return UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    }
    
    class var c33: UIColor {
        return UIColor(0x333333)
    }
    
}

