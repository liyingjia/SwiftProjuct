//
//  ViewController.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2020/12/29.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        getWeatherInfo()
    }


}

func getWeatherInfo() -> Void {
    let weatherUrl:String = "http://weatherapi.market.xiaomi.com/wtr-v2/temp/realtime?cityId="
    let parameters = ["cityId":"101040100"];
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
}

func LYLog<T>(message : T,file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    let fileName = (file as NSString).lastPathComponent
    #if DEBUG
    print("\(fileName)-[\(funcName)]-[\(lineNum)]-\(message)")
    #endif
}
