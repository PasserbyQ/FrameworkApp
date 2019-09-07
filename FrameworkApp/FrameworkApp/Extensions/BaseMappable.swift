//
//  BaseMappable.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/11.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

/**
 * model继承该类，减少大量重复代码
 */
class BaseMappable: NSObject, Mappable {
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        let propertyNames = self.getAllPropertys()
        for key in propertyNames {
            print(key)
            var property = value(forKey: key)
            property <- map[key]
            setValue(property, forKey: key)
        }
    }  
}
