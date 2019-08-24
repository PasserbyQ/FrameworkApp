
//
//  HomeModel.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit
import ObjectMapper

@objcMembers class HomeModel: BaseMappable {
    
    var ids: String?
    var job: String?
    var salary: String = ""
    var info: String = "1"
    var head: String = "1"
    var publish: String = "1"

}
