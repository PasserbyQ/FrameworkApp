//
//  URLs.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit

struct URLs {
    
    // 服务器地址
    static let server = CacheManager.shared.server!
    
    // 登录
    static let login = server + "/api/login"
    
    // 工作列表
    static let jods = server + "/home/jods"

}
