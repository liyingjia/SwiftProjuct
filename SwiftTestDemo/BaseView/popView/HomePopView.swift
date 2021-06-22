//
//  HomePopView.swift
//  SwiftTestDemo
//
//  Created by liying on 2021/1/12.
//

import UIKit

//代理协议
protocol DelegateNames:NSObjectProtocol {
    func method(index:Int)
}

class HomePopView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    //定义闭包类型
    typealias ClickItemIndex = (Int) -> Void
    //接收上个页面穿过来的闭包块
    var clickIndex : ClickItemIndex?
    
    //创建代理属性
    weak var delegate:DelegateNames?
    
    var tableView:UITableView = UITableView.init(frame: CGRect.zero, style: .plain)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //闭包传值
//        if (self.clickIndex != nil) {
//            self.clickIndex!(indexPath.row)
//        }
        
        //代理传值
        delegate?.method(index: indexPath.row)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension HomePopView{
    func configUI() {
        self.tableView = UITableView(frame: CGRect(x:0,y:0,width: 0,height: 0))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 49
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        self.addSubview(self.tableView)
        self.tableView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(0)
            make.left.right.equalTo(self).offset(0)
            make.bottom.equalTo(self).offset(0)
        }
    }
    
    func setClickIndexItem(tempItem:@escaping ClickItemIndex) {
        self.clickIndex = tempItem
    }
}
