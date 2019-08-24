//
//  NSObject+Runtime.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/24.
//  Copyright © 2019 yu qin. All rights reserved.
//

import Foundation

extension NSObject {
    
    /**
     * 类名
     */
    fileprivate func getClassName(cls: AnyClass) -> String {
        let clsName = NSStringFromClass(cls).components(separatedBy: ".").last!
        return clsName
    }
    
    /**
     * 获取属性列表
     */
    func getAllPropertys()->[String]{
        var result = [String]()
        
        var count: UInt32 = 0
        
        let buff = class_copyPropertyList(object_getClass(self), &count)
        
        let countInt = Int(count)
        
        
        for i in 0 ..< countInt {
            let temp = buff![i]
            let tempPro = property_getName(temp)
            
            let proper = String.init(utf8String: tempPro)
            
            result.append(proper!)
            
        }
        
        return result
        
    }
    
}
