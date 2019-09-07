//
//  ViewController.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit
import MBProgressHUD
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!


    let disposed = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MBProgressHUD.showError("失败了")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            MBProgressHUD.hide()
//        }
    }
    
    
    func addObserver() {
        
        let phoneValid = phoneTextField.rx.text.orEmpty
            .map{ $0.count > 5 }
            .share(replay: 1)
        
        let passwordValid = passwordTextField.rx.text.orEmpty
            .map{ $0.count > 2 }
            .share(replay: 1)
        
        let everyValid = Observable.combineLatest(phoneValid,passwordValid) { $0 && $1 }
            .share(replay: 1)
        
        everyValid.subscribe(onNext: { [unowned self] (validate) in
            self.loginButton.isEnabled = validate
        }).disposed(by: disposed)
    }
    
    
    
    @IBAction func test() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}

