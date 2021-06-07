//
//  BaseViewController.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2021/1/12.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
    }

}


extension BaseViewController{
    func setupNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(self.registerBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(self.loginBtnClick))
//        navigationItem.rightBarButtonItems =
    }
}

extension BaseViewController{
    @objc open func registerBtnClick(){
        print("registerBtnClick")
    }
    
    @objc open func loginBtnClick(){
        print("loginBtnClick")
    }
}
