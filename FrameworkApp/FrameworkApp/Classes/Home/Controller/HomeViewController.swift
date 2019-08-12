//
//  HomeViewController.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }
    
    /**
     * 绑定
     */
    func bindViewModel() {
        
        self.view.showMProgress()
        
        weak var weakself = self
        viewModel.getData(success: {
            // 这里数据源已经更新
            weakself?.view.hideMPMessage()
        }) { (code, message) in
            // 这里对返回的错误信息进行处理
            weakself?.view.hideMPMessage()
            weakself?.view.showMBMessage(message)
        }
    }
    


}
