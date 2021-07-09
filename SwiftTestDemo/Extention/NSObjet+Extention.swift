//
//  CLNSObjet+Extention.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/28.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit

extension NSObject {
    
    static var className: String {
        get {
            return String(describing: self)
        }
    }
    
    //MARK: - Returns: 当前控制器
    public func id_getCurrentViewcontroller() -> UIViewController?{
        let rootController = UIApplication.shared.keyWindow?.rootViewController
        if let tabController = rootController as? UITabBarController   {
            if let navController = tabController.selectedViewController as? UINavigationController{
                return navController.children.last
            }else{
                return tabController
            }
        }else if let navController = rootController as? UINavigationController {
            
            return navController.children.last
        }else{
            
            return rootController
        }
    }
    
}

