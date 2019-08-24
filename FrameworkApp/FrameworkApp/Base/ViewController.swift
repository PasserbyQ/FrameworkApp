//
//  ViewController.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MBProgressHUD.showError("失败了")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            MBProgressHUD.hide()
//        }
    }
    
    @IBAction func test() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}

