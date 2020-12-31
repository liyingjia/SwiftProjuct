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
//        let appearance = UIBarButtonItem.appearance()
//        appearance.setBackButtonTitlePositionAdjustment(UIOffset.init(horizontal: 0.0, vertical: -60), for: .default)
//        self.navigationBar.isTranslucent = true
//        self.navigationBar.barTintColor = UIColor.init(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 250/255.0)
//        #if swift(>=4.0)
//        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16)]
//        #elseif swift(>=3.0)
//        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0), NSFontAttributeName: UIFont.systemFont(ofSize: 16.0)]
//        #endif
//        self.navigationBar.tintColor = UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0)
//        self.navigationItem.title = "Example"
        
        // Do any additional setup after loading the view.
    }

}

extension LYNavigationController
{
    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
