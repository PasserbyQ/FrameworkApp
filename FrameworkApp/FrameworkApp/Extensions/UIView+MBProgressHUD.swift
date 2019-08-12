//
//  UIView+MBProgressHUD.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/11.
//  Copyright © 2019 yu qin. All rights reserved.
//

import Foundation
import MBProgressHUD

public extension UIView {
    
    /**
     * 提示信息
     */
    func showMBMessage(_ message:String,_ afterDelay: TimeInterval = 1.5){
        MBProgressHUD.hide(for: self, animated: true)
        
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .text;
        hud.margin = 10
        hud.removeFromSuperViewOnHide = true
        hud.label.text = message;
        hud.label.numberOfLines = 0;
        hud.contentColor = UIColor.white
        hud.bezelView.backgroundColor = UIColor.black
        hud.bezelView.style = .blur
        hud.minSize = CGSize(width: 120, height: 44)
        
        hud.hide(animated: true, afterDelay: afterDelay)
    }
    
    /**
     * 显示加载框
     */
    func showMProgress(){
        MBProgressHUD.showAdded(to: self, animated: true)
    }
    
    /**
     * 隐藏加载框
     */
    func hideMPMessage(){
        MBProgressHUD.hide(for: self, animated: true)
    }
    
}
