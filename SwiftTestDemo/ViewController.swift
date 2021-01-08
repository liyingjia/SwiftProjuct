//
//  ViewController.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2020/12/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }


}

func LYLog<T>(message : T,file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    let fileName = (file as NSString).lastPathComponent
    #if DEBUG
    print("\(fileName)-[\(funcName)]-[\(lineNum)]-\(message)")
    #endif
}
