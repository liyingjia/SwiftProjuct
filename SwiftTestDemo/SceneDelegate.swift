//
//  SceneDelegate.swift
//  SwiftTestDemo
//
//  Created by liying on 2020/12/29.
//

import UIKit
import ESTabBarController_swift

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        self.setupTabBar()
//        self.customRemindStyle()
        
        TABAnimated.shared()?.initWithShimmerAnimated()
        TABAnimated.shared()?.openLog = true
        TABAnimated.shared()?.openAnimationTag = true
        
        
        self.window?.rootViewController = BaseTabBarViewController()
        self.setNavBarAppearence()
        guard let _ = (scene as? UIWindowScene) else { return }
//        var windows = (UIApplication.shared.delegate as! AppDelegate).window
//        windows  = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func setNavBarAppearence()
    {
        // 设置导航栏默认的背景颜色
        WRNavigationBar.defaultNavBarBarTintColor = UIColor.init(red: 0/255.0, green: 175/255.0, blue: 240/255.0, alpha: 1)
        // 设置导航栏所有按钮的默认颜色
        WRNavigationBar.defaultNavBarTintColor = .white
        // 设置导航栏标题默认颜色
        WRNavigationBar.defaultNavBarTitleColor = .white
        // 统一设置状态栏样式
        WRNavigationBar.defaultStatusBarStyle = .lightContent
        // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
        WRNavigationBar.defaultShadowImageHidden = true
    }

}

