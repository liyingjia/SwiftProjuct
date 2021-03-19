//
//  ViewController.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2020/12/29.
//

import UIKit
import Alamofire
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        getWeatherInfo()

//        SVProgressHUD.showSuccess(withStatus: "加载成功")
//        SVProgressHUD.showError(withStatus: "加载失败")
//        SVProgressHUD.showInfo(withStatus: "请输入姓名")
//        SVProgressHUD.showProgress(0.1)
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.show(withStatus: "加载中。。。")
    }


}

func getWeatherInfo() -> Void {
    let weatherUrl:String = "http://weatherapi.market.xiaomi.com/wtr-v2/temp/realtime?cityId="
    let parameters = ["cityId":"101040100"];
    SVProgressHUD.show()
    Alamofire.request(weatherUrl,method:.get,parameters:parameters,encoding: URLEncoding.default).responseJSON { (response) in
                switch response.result {
                case .success(let json ):
                    let jsonDic = json as? NSDictionary
                    print(jsonDic! as NSDictionary);
                    break
                case .failure(let error):
                    print("error:\(error)")
                    break
                }
            }
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        SVProgressHUD.dismiss()
    }
    
}

func LYLog<T>(message : T,file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    let fileName = (file as NSString).lastPathComponent
    #if DEBUG
    print("\(fileName)-[\(funcName)]-[\(lineNum)]-\(message)")
    #endif
}
