//
//  BaseTabBarViewController.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2021/4/2.
//

import UIKit
import ESTabBarController_swift

class BaseTabBarViewController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChildViewControllers()
                
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Private
//    func setupTabBar() {
//        let tabBarController = ESTabBarController()
//        let v1 = FirstViewController()
//        let v2 = SecondViewController()
//        let v3 = ThirdViewController()
//        let v4 = ForthViewController()
//        let v5 = HomeViewController()
//
//        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
//        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
//        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
//        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
//        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
//
//        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
//
//    }
    
//    func customRemindStyle() {
////        let tabBarController = ESTabBarController()
//        let v1 = FirstViewController()
//        let v2 = SecondViewController()
//        let v3 = ThirdViewController()
//        let v4 = ForthViewController()
//        let v5 = HomeViewController()
//
//        v1.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
//        v2.tabBarItem = ESTabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
//        v3.tabBarItem = ESTabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
//        v4.tabBarItem = ESTabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
//        v5.tabBarItem = ESTabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
//
//        if let tabBarItem = v1.tabBarItem as? ESTabBarItem {
//            tabBarItem.badgeValue = "New"
//        }
//        if let tabBarItem = v2.tabBarItem as? ESTabBarItem {
//            tabBarItem.badgeValue = "99+"
//        }
//        if let tabBarItem = v3.tabBarItem as? ESTabBarItem {
//            tabBarItem.badgeValue = "1"
//            tabBarItem.badgeColor = UIColor.blue
//        }
//        if let tabBarItem = v4.tabBarItem as? ESTabBarItem {
//            tabBarItem.badgeValue = ""
//        }
//        if let tabBarItem = v5.tabBarItem as? ESTabBarItem {
//            tabBarItem.badgeValue = nil
//        }
//
//        let navigationController1 = LYNavigationController.init(rootViewController: v1)
//        let navigationController2 = LYNavigationController.init(rootViewController: v2)
//        let navigationController3 = LYNavigationController.init(rootViewController: v3)
//        let navigationController4 = LYNavigationController.init(rootViewController: v4)
//        let navigationController5 = LYNavigationController.init(rootViewController: v5)
//
//        self.viewControllers = [navigationController1, navigationController2, navigationController3, navigationController4, navigationController5]
//
//        v1.title = "主页"
//        v2.title = "添加"
//        v3.title = "我的"
//        v4.title = "我的"
//        v5.title = "我的"
//
//    }


}

// MARK: - 注释
extension BaseTabBarViewController{
    
    func addChildViewControllers() {

        setChildViewController(childController: FirstViewController(), title: "主页", normalImageName: "home", selectImageName: "home_1")
        setChildViewController(childController: SecondViewController(), title: "添加", normalImageName: "find", selectImageName: "find_1")
        setChildViewController(childController: ThirdViewController(), title: "发现", normalImageName: "photo", selectImageName: "photo_1")
        setChildViewController(childController: ForthViewController(), title: "消息", normalImageName: "favor", selectImageName: "favor_1")
        setChildViewController(childController: HomeViewController(), title: "我的", normalImageName: "me", selectImageName: "me_1")
    }
    
    func setChildViewController(childController: UIViewController, title: NSString, normalImageName: NSString,selectImageName: NSString) -> Void {
        
        childController.tabBarItem = ESTabBarItem.init(title: title as String, image: UIImage.init(named: normalImageName as String), selectedImage: UIImage.init(named: selectImageName as String))
        let navigationController = LYNavigationController.init(rootViewController: childController)
        
        childController.title = title as String
        addChild(navigationController)
    }
}
