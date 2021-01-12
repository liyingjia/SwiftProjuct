//
//  UIBarButtonItemExtension.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2021/1/12.
//

import UIKit

extension UIBarButtonItem{
    /*
     方式一
     */
//    convenience init(imageName : String){
//        self.init()
//        let btn = UIButton()
//        btn.setImage(UIImage(named: imageName), for: .normal)
//        btn.setImage(UIImage(named: imageName + "_1"), for: .highlighted)
//        btn.sizeToFit()
//
//        customView = btn
//    }
    
    /*
     方式二
     */
    convenience init(imageName : String){
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_1"), for: .highlighted)
        btn.sizeToFit()
        self.init(customView : btn)
    }
}
