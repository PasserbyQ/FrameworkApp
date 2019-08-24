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
        
        let server = "https://www.easy-mock.com/mock/5d243e84e60018399bbd3a6d"
        if type == .dev {
//            server = "http://127.0.0.1:8080"
        } else if type == .test {
//            server = "http://127.0.0.1:8080"
        } else {
//            server = "http://127.0.0.1:8080"
        }
        envType = type
        // 进行存储
        CacheManager.shared.server = server
    }
    
}
