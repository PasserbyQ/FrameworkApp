//
//  CacheManager.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/24.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit

/**
 * 缓存工具，最好统一管理
 */

class CacheManager: NSObject {

    static let shared = CacheManager()
    
    
    var server: String? {
        set {
            set(newValue!,"server")
        }
        get {
            return UserDefaults.standard.value(forKey: "server") as? String
        }
    }
    
    func set(_ value: Any,_ key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    
    
    func set(_ value: String,_ key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func set(_ boolValue: Bool,_ key: String) {
        UserDefaults.standard.set(boolValue, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func set(_ intValue: Int,_ key: String) {
        UserDefaults.standard.set(intValue, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
