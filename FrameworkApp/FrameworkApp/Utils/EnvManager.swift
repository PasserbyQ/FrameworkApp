//
//  EnvManager.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit

enum EnvType: String {
    case dev        //开发
    case test       //测试
    case product    //生产
}

class EnvManager: NSObject {

    static let shared = EnvManager()
    
    var envType:EnvType = .test
    
    
    /**
     * 配置与环境有关的参数
     */
    func changeEnvironment(type:EnvType) {
        
        var server = "http://10.19.146.153:8080"
        if type == .dev {
            server = "http://10.19.146.153:8080"
        } else if type == .test {
            server = "http://110.19.46.53:8080"
        } else {
            server = "https://city-express.zto.com"
        }
        envType = type
        // 进行存储
        //CacheManager.shared.set(server, "server")
    }
    
}
