//
//  ThirdViewController.swift
//  SwiftTestDemo
//
//  Created by liying on 2020/12/29.
//

import UIKit

class ThirdViewController: BaseViewController {
    
    var tools : HttpTools = HttpTools()
    var fourthVC : ForthViewController = ForthViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //获取infoPlist文件
        let mainBundle = Bundle.main
        let infoP = mainBundle.infoDictionary
        let bundleName = infoP!["CFBundleName"] as! String
        
        //根据类名获取类
        guard let className =  NSClassFromString(bundleName + ".ThirdViewController") else{
            print("没有获取命名空间")
            return
        }
        print("className:\(className)")
        
        // Do any additional setup after loading the view.
        self.title                = "我的"
        self.view.backgroundColor = UIColor.white
        online(age: 18)
        stringMethod()
        switchMethod()
        arrayMethod()
        dictMethod()
        optionMethod()
        jsonData()
        
        //元组--(一般用于方法的返回值)
//        let info1 = (name : "ly",age : 18,height : 1.70)
//        info1.0
//        info1.1
        //使用别名
//        info1.name
//        info1.age
        //元祖中元素的别名，就是元祖的名称
//        let (name1,age1,height1) = ("ly", 18, 170)
//        name1
//        age1
//        height1

        
        
    }
    // MARK:-数组的使用
    func arrayMethod() -> Void {
        //数组
        var array = [String]()
        var array1 = [String]()
        //添加
        array.append("li")
        array.append("wang")
        array.append("jia")
        array.append("huang")
        
        array1.append("sun")
        array1.append("qian")
        array1.append("mei")
        array1.append("liu")
        //移除
        array.remove(at: 0)
        //遍历
        for i in 0..<array.count {
            print("index:\(array[i])")
        }
        
        for name in array {
            print("noIndex:\(name)")
        }
        
        for name in array[0..<2] {
            print("range:\(name)")
        }

        
        //数组的合并,相同类型的数组才能合并
        let resultArrat = array + array1
        print("resultArray\(resultArrat)")
    }
    
    // MARK:-字符串使用
    func stringMethod() -> Void {
        //字符串拼接
        let name = "ly"
        let ages = 20
        let info = "my name is \(name),my age is \(ages)"
        print("info:\(info)")
        
        let min = 2
        let second = 8
        let timeString = String(format: "%d:%02d", arguments: [min,second])
        print("timeString:\(timeString)")
        
        //字符串截取
        let urlString = "www.baidu.com"
        let header = (urlString as NSString).substring(to: 3)
        let middle = (urlString as NSString).substring(with: NSMakeRange(3, 7))
        let footer = (urlString as NSString).substring(from: 10)
        print("\(header),\(middle),\(footer)")
    }
    
    // MARK:-swich用法
    func switchMethod() -> Void {
        let age = 12
        //switch可以判断浮点型，字符串
        switch age {
        case 10,11:
            print("正常")
        default:
            print("非正常")
        }
        
        let a = 3.14
        switch a {
        case 3.14:
            print("π")
        default:
            print("非π")
        }
        
        //switch可以判断字符串
        let m = 20
        let n = 30
        var result = 0
        let string = "*"
        switch string {
        case "+":
            result = m + n
        case "-":
            result = m - n
        case "*":
            result = m * n
        case "/":
            result = m / n
        default:
            print("非法操作")
        }
        
        print("\(result)")
        
        //switch可以判断区间
        //开区间 0..<20  0~19  闭区间 0...20 0~20
        let score = 100
        
        switch score {
        case 0..<60:
            print("不及格")
        case 60..<80:
            print("及格")
        case 80..<90:
            print("良好")
        case 90...100:
            print("优秀")
        default:
            print("不合理的分数")
        }
    }
    
    // MARK:-字典的使用
    func dictMethod() -> Void {
        //字典
//        let dict = ["name":"li","age":20,"height":100] as [String : Any]
        var dictM = [String : AnyObject]()
        //添加元素
        dictM["name"] = "ly" as AnyObject
        dictM["age"] = 18 as AnyObject
        dictM["weight"] = 100 as AnyObject
        
        //删除元素
        dictM.removeValue(forKey: "name")
        //修改元素
        dictM["age"] = 20 as AnyObject
        //遍历元素
        for key in dictM.keys {
            print("allkeys:\(key)")
        }
        for value in dictM.values {
            print("allvalues:\(value)")
        }
        for (key, value) in dictM {
            print(key,value)
        }
        for i in stride(from: 3, through: 11, by: 2) {
           print(i) //5  7  9  11
        }
        //合并元素  类型相同也不能相加合并
    }
    // MARK:-可选类型的shiyong
    func optionMethod() -> Void {
        //可选类型
        var sax : String? = nil
        sax = "why"
        //!解包---可选类型+！强制解包
        //如果可选类型为nil，强制解包系统会崩溃
        //建议：在强制解包前，先对可选类型进行判断是否为nil
        if sax != nil {
            print(sax!)
        }
        //应用场景
        let url : NSURL? = NSURL(string: "http:\\www.bai.com")
        
        if let url = url {
            let request = NSURLRequest(url: url as URL)
            
            print(request)
        }
    }
    
    // MARK:guard语法：guard必须放到函数里面使用
    //guard后面的判断语句为true，那么执行后面的语句块
    //如果为false，那么执行else后面的{}
    func online(age : Int) -> Void {
        guard age >= 18 else {
            print("回家去")
            return
        }
        guard age > 60 else {
            print("回家去")
            return
        }
        //为true时，执行下面的语句
        print("开始上网")
    }
    // MARK:-json文件转字典
    func jsonData() -> Void {
        //获取json文件路径
        guard let jsonPath = Bundle.main.path(forResource: "marketOrderInfo.txt", ofType: nil) else {
            print("没有检测到对应的文件路径")
            return
        }
        //读取json文件中的数据
        guard let jsonData = NSData(contentsOfFile: jsonPath) else {
            print("没有获取到json文件中的数据")
            return
        }
        //将data转成字典
        guard let anyObject = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) else{
            return
        }
        guard let dict = anyObject as? [String : AnyObject] else {
            return
        }
        
        CWLog(dict)
        
    }
    
    // MARK:-异常处理方法--3中处理方式
    func throwsMethod() -> Void {
        //获取json文件路径
        guard let jsonPath = Bundle.main.path(forResource: "marketOrderInfo.txt", ofType: nil) else {
            print("没有检测到对应的文件路径")
            return
        }
        //读取json文件中的数据
        guard let jsonData = NSData(contentsOfFile: jsonPath) else {
            print("没有获取到json文件中的数据")
            return
        }
        /*
         方式一：try方式 程序员手动捕捉异常
         do {
             try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers)
         } catch  {
             //error异常的对象
             print(error)
         }
         */
        
        /*
         方式二：try？(常用方式) 系统帮助我们处理异常，如果该方法出现了异常，则方法返回nil，如果没有返回异常，则返回对应的对象
                返回的是可选类型，需要做个安全校验 guard
         guard let anyObject = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) else{
             return
         }
         */
        
        let pattern = "1111"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else{
            return
        }
        
        
        /*
         方式三：try!方法（不建议，非常危险） 直接告诉系统，该方法没有异常，如果该方法出现异常，那么直接报错（崩溃）
         guard let anyObject = try！ JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) else{
             return
         }
         */
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //解决循环引用[weak self]
        weak var weakself = self
        //闭包作为函数参数的使用
        tools.lodaData { [weak self](String) in
            print(String)
//            weakself?.view.backgroundColor  = UIColor.red
            self?.view.backgroundColor  = UIColor.red
        }
//        self.navigationController?.pushViewController(fourthVC, animated: true)
    }

     deinit{
        print("没有循环引用")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
