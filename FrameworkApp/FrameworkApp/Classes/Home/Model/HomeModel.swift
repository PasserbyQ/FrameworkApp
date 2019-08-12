
//
//  HomeModel.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeModel: Mappable {
    
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
    
    
}
