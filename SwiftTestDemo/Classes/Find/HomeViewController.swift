//
//  HomeViewController.swift
//  SwiftTestDemo
//
//  Created by liying on 2021/1/12.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    
    func canThrowAnError() throws {
        
    }

}

extension HomeViewController{
    func handleOpenURL(url:NSURL, result:(_ result : Bool) -> ()) {
        
    }
}


