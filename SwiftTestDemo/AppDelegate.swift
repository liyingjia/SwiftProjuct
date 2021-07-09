//
//  AppDelegate.swift
//  SwiftTestDemo
//
//  Created by liying on 2020/12/29.
//

import UIKit

@main
@available(iOS 13.0, *)
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        TABAnimated.shared()?.initWithShimmerAnimated()
        TABAnimated.shared()?.openLog = true
        TABAnimated.shared()?.openAnimationTag = true
        
        self.setNavBarAppearence()
        self.window?.rootViewController = BaseTabBarViewController()
        self.window?.makeKeyAndVisible()
        launchExample02(BaseTabBarViewController())
        return true
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
@available(iOS 13.0, *)
extension AppDelegate{
    /// 加载网络图片
    func launchExample02(_ homeVC: UIViewController) {
        let adView = ZLaunchAd.create(waitTime: 5)
        
        request { model in
            let buttonConfig = ZLaunchSkipButtonConfig()
            buttonConfig.skipBtnType = model.skipBtnType
            let imageResource = ZLaunchAdImageResourceConfigure()
            imageResource.imageNameOrImageURL = model.imgUrl
            imageResource.animationType = model.animationType
            imageResource.imageDuration = model.duration
            imageResource.imageFrame = CGRect(x: 0, y: 0, width: Z_SCREEN_WIDTH, height: Z_SCREEN_WIDTH*model.height/model.width)
            /// 设置图片、跳过按钮
            adView.setImageResource(imageResource, buttonConfig: buttonConfig, action: {
                let vc = UIViewController()
                vc.view.backgroundColor = UIColor.yellow
                self.id_getCurrentViewcontroller()?.navigationController?.pushViewController(vc, animated: true)
            })
        }
    }
}

//MARK: - 模拟请求数据，此处解析json文件
@available(iOS 13.0, *)
extension AppDelegate {
    func request(_ completion: @escaping (AdModel)->()) -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            if let path = Bundle.main.path(forResource: "data", ofType: "json") {
                let url = URL(fileURLWithPath: path)
                do {
                    let data = try Data(contentsOf: url)
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    if let dict = json as? [String: Any],
                        let dataArray = dict["data"] as? [[String: Any]] {
                        /// 随机显示
                        let idx = Int(arc4random()) % dataArray.count
                        let model = AdModel(dataArray[idx])
                        completion(model)
                    }
                } catch  {
                    print(error)
                }
            }
        }
    }
}


