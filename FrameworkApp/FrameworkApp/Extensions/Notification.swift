//
//  Notification.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/9/1.
//  Copyright © 2019 yu qin. All rights reserved.
//

import Foundation


/**
 * 扩展通知的名字方便使用
 */
extension Notification.Name {
    
    // 登录
    static let login = Notification.Name(rawValue: "login")
    // 退出登录
    static let logout = Notification.Name(rawValue: "logout")
    
}
