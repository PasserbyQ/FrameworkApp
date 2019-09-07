//
//  MBProgressHUD.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/11.
//  Copyright © 2019 yu qin. All rights reserved.
//

import Foundation
import MBProgressHUD

extension MBProgressHUD {
    
    /**
     * 显示等待消息
     */
    class func showLoading(_ inView: UIView? = nil) {
        let view = viewToShow(inView)
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.show(animated: true)
    }
    
    /*****************************显示普通消息****************************/
    
    class func showMessage(_ message: String,  _ duration: TimeInterval) {
        showMessage(message, duration, nil)
    }
    
    class func showMessage(_ message: String, _ inView: UIView) {
        showMessage(message, 1.5, inView)
    }
    
    class func showMessage(_ message: String, _ duration: TimeInterval = 1.5, _ inView: UIView? = nil) {
        let view = viewToShow(inView)
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.detailsLabel.text = message;
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = .black
        hud.detailsLabel.textColor = .white
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 15)
        hud.margin = 10
        hud.isUserInteractionEnabled = false
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: duration)
    }
    
    /**
     * 显示成功消息
     */
    class func showSuccess(_ message: String, _ inView: UIView? = nil) {
        let view = viewToShow(inView)
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.customView = UIImageView(image: UIImage(named: "icon_success")!) //自定义视图显示图片
        hud.detailsLabel.text = message;
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = .black
        hud.detailsLabel.textColor = .white
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 15)
        hud.margin = 10
        hud.isSquare = true
        hud.isUserInteractionEnabled = false
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
    
    
    /**
     * 显示失败消息
     */
    class func showError(_ message: String, _ inView: UIView? = nil) {
        let view = viewToShow(inView)
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView //模式设置为自定义视图
        hud.customView = UIImageView(image: UIImage(named: "icon_error")!) //自定义视图显示图片
        hud.detailsLabel.text = message;
        hud.bezelView.style = .solidColor;
        hud.bezelView.color = .black
        hud.detailsLabel.textColor = .white
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 15)
        hud.margin = 10
        hud.isSquare = true
        hud.isUserInteractionEnabled = false
        hud.removeFromSuperViewOnHide = true
        //HUD窗口显示1秒后自动隐藏
        hud.hide(animated: true, afterDelay: 1)
    }
    
    /**
     * 隐藏
     */
    class func hide(_ forView: UIView? = nil) {
        self.hide(for: viewToShow(forView), animated: true)
    }
    
    /**
     * 获取用于显示提示框的view
     */
    class func viewToShow(_ inView: UIView? = nil) -> UIView {
        if let v = inView {
           return v
        }
        let window = UIApplication.shared.keyWindow
        return window!
    }
    
}
