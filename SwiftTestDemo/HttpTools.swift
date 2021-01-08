//
//  HttpTools.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2021/1/8.
//

import UIKit

class HttpTools: NSObject {
    //闭包作为函数参数---@escaping逃逸闭包,默认是非逃逸闭包@noescaping
    func lodaData(callBack:@escaping (_ jsonData : String) -> ()){
        //异步子线程
        DispatchQueue.global().async {
            print("发送网络请求:\(Thread.current)")
            //同步主线程
            DispatchQueue.main.sync {
                print("获取到数据:\(Thread.current)")
                callBack("jsonData数据")
            }
        }
    }
}
