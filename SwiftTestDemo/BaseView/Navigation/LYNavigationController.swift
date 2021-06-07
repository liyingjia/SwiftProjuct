//
//  LYNavigationController.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2020/12/30.
//

import UIKit

class LYNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

}

extension LYNavigationController
{
    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterback"), style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func navigationBack() {
        popViewController(animated: true)
    }
}
