//
//  Button_Extendion.swift
//  SwiftTestDemo
//
//  Created by liying on 2021/1/11.
//

import UIKit

extension UIButton{
    //swift中类方法是以class开头的方法，类似于OC中+开头的方法
//    func createButton(imageName : String, bgImageName : String) -> UIButton {
//        let btn = UIButton()
//        btn.setImage(UIImage(named: imageName), for: .normal)
//        btn.setImage(UIImage(named: imageName), for: .highlighted)
//        btn.setBackgroundImage(UIImage(named: bgImageName), for: .normal)
//        btn.setBackgroundImage(UIImage(named: bgImageName), for: .highlighted)
//        //设置了按钮图片后，大小可以使用sizeToFit
//        btn.sizeToFit()
//        
//        return btn
//    }
    
    //convenience: 便利  使用convenience修饰的构造函数叫做便利构造函数
    //便利构造函数通常用在对系统的类进行构造函数的扩充使用
    /*
     便利构造函数的特点
        1.便利构造函数通常都是写在extension里面
        2.便利构造函数init前面需要加上convenience
        3.在便利构造函数中需要明确的调用self.init()
     */
    convenience init(imageName : String,bgImageName : String) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName), for: .highlighted)
        setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        setBackgroundImage(UIImage(named: bgImageName), for: .highlighted)
        //设置了按钮图片后，大小可以使用sizeToFit
        sizeToFit()
    }
}
