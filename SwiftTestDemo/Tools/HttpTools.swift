//
//  HttpTools.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2021/1/8.
//

import AFNetworking

enum RequestType {
    case GET
    case POST
}

class HttpTools: AFHTTPSessionManager {
    
    static let shareInstance: HttpTools = {
        let tools = HttpTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tools
        
    }()
    
    
    
    
    var status = String()
    
    
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


extension HttpTools{
    func request(methodType:RequestType,urlString:String,parameters:[String:AnyObject],finished:@escaping ( _ result:AnyObject?, _ error:Error?)->()){
//        let successCallBack =
//        let successCallBack = {(task:URLSessionDataTask,result:AnyObject?) -> Void in
//            finished(result,nil)
//        }
//        let failCallBack = {(task:URLSessionDataTask?,error:Error) -> Void in
//            finished(nil,error)
//        }
        
        
    }
}
