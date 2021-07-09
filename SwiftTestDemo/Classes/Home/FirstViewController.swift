//
//  FirstViewController.swift
//  SwiftTestDemo
//
//  Created by liying on 2020/12/29.
//


import UIKit
import SnapKit
import TFEasyCoder

class FirstViewController: BaseViewController {
    //MARK: - 懒加载
//    lazy var tableView : UITableView = UITableView()
    
    var array = ["一天宛如一年 一年宛如一天 任时光流转 我还是我 一遍用了千遍 千遍只为一遍 当回忆久远 初心始现 我做了那么多改变 只是为了我心中不变 默默地深爱着你无论相见不相见 我做了那么多改变 只是为了我心中不变 我多想你看见","一天宛如一年","一天宛如一年 一年宛如一天 任时光流转 我还是我 一遍用了千遍 千遍只为一遍 ","一天宛如一年 一年宛如一天 任时光流转 我还是我 一遍用了千遍 千遍只为一遍 当回忆久远 初心始现 我做了那么多改变 只是为了我心中不变 默默地深爱着你无论相见不相见 我做了那么多改变 只是为了我心中不变 我多想你看见","一天宛如一年 一年宛如一天 任时光流转 我还是我 一现 我做了那么多改变 只是为了我心中不变 默默地深爱着你无论相见不相见 我做了那么多改变 只是为了我心中不变 我多想你看见","一天了千遍 千遍只为一遍那么多改变 只是为了我心中不变无论相见不相见 我做了那么多改变 只是看见","一天宛如一年 一年宛如一天 任时光流转 我还是我 一遍用了千遍 千遍只为一遍 当回忆久远 初心始现 我做了那么多改变 只是为了我心中不变 "]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBaseTableViewCell", for: indexPath) as! HomeBaseTableViewCell
        cell.nameLabel.text = "fadsfadf"
        cell.titleLabel.text = array[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewCon = ViewController()
        self.navigationController?.pushViewController(viewCon, animated: true)
//        let nav = LYNavigationController()
        
//        self.present(viewCon, animated: true, completion: nil)
    }
    // MARK:-系统方法
    override func viewDidLoad() {
        super.viewDidLoad()
//        HttpTools.shareInstance.status
        self.view.backgroundColor = UIColor.white
        self.title = "主页"
        navBarBarTintColor = UIColor.init(hex: "#FB0520")
        // 设置初始导航栏透明度
//        navBarBackgroundAlpha = 0
        
        self.tableView = UITableView(frame: CGRect(x:0,y:0,width: 0,height: 0))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 49
        self.tableView.register(HomeBaseTableViewCell.classForCoder(), forCellReuseIdentifier: "HomeBaseTableViewCell")
        
        self.tableView.tabAnimated = TABTableAnimated.init(cellClass: HomeBaseTableViewCell.classForCoder(), cellHeight: 100)
        self.tableView.tabAnimated?.canLoadAgain = true
        self.tableView.tabAnimated?.adjustBlock = { (manager) in
            manager.animation()?(0)?.height()(12)?.width()(100)
            manager.animation()?(1)?.up()(10)
        }
        
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(0)
            make.left.right.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(-HYDevice_TabBar_Height)
        }
       
        LYLog(message: 1243)
        
//        self.tableView.tab_startAnimation {
//            
//            self.afterGetData()
//        }
//        
//        self.tableView.tab_addPullLoadingActionHandler {
//            self.array.append("我做了那么多改变")
//            self.array.append("我做了那么多改变")
//            self.array.append("我做了那么多改变")
//            self.array.append("我做了那么多改变")
//            self.array.append("我做了那么多改变")
//
//            self.afterGetData()
//            sleep(2)
//            self.tableView.tab_stopPullLoading()
//        }
        
    }
    
    override func loginBtnClick() {
        self.tableView.tab_startAnimation {
            
            self.afterGetData()
        }
    }
    
    func afterGetData() -> Void {
        self.tableView.reloadData()
        self.tableView.tab_endAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - 滑动改变导航栏透明度、标题颜色、左右按钮颜色、状态栏颜色
extension FirstViewController
{
//    func scrollViewDidScroll(_ scrollView: UIScrollView)
//    {
//        let offsetY = scrollView.contentOffset.y
//        if (offsetY > 100)
//        {
//            let alpha = (offsetY - 100) / CGFloat(WRNavigationBar.navBarBottom())
//            navBarBackgroundAlpha = alpha
//            navBarTintColor = UIColor.white.withAlphaComponent(alpha)
//            navBarTitleColor = UIColor.white.withAlphaComponent(alpha)
//            statusBarStyle = .default
//        }
//        else
//        {
//            navBarBackgroundAlpha = 0
//            navBarTintColor = .white
//            navBarTitleColor = .white
//            statusBarStyle = .lightContent
//        }
//    }
    
    
}

