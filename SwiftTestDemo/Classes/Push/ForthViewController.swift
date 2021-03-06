//
//  ForthViewController.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2021/1/6.
//

import UIKit

class ForthViewController: UIViewController {
    
    var tools : HttpTools = HttpTools()
    var fourthVC : ViewController = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "push来的"
        self.view.backgroundColor = UIColor.yellow
        print(makeCoffee())
        print(makeCoffee(coffeeName: "拿铁"))
        var m = 20
        var n = 30
        swapNum(m: &m, n: &n)
        print("m:\(m),n:\(n)")
        
        let person = Person()
        person.age = 20
        person.setValuesForKeys(["age":18,"name":"ly"])
        print("age:\(person.age)")
        
        // Do any additional setup after loading the view.
    }
    
    //函数--默认参数
    func makeCoffee(coffeeName: String = "雀巢") -> String {
        return "制作了一杯\(coffeeName)咖啡"
    }
    //指针函数
    func swapNum(m: inout Int, n: inout Int) {
        let temp = m
        m = n
        n = temp
    }
    
    //类
    class Person: NSObject {
        var age : Int = 0
        //d定义类属性,通过类名访问
        static var courseCount = 0
        //重新次方法，为了防止kvc给不存在的属性赋值
        //override:如果写的某个方法是对父类的方法进行的重写，那么必须在该方法前加上override
        override func setValue(_ value: Any?, forUndefinedKey key: String) {
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //闭包作为函数参数的使用
        tools.lodaData { (String) in
            print(String)
        }
        self.navigationController?.pushViewController(fourthVC, animated: true)
    }

     deinit{
        print("没有循环引用")
    }

}
