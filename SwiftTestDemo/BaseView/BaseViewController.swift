//
//  BaseViewController.swift
//  SwiftTestDemo
//
//  Created by liying on 2021/1/12.
//

import UIKit
import EmptyDataSet_Swift


class BaseViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, EmptyDataSetSource, EmptyDataSetDelegate{
    
    var config: Configuration?
    var tableView = UITableView.init(frame: CGRect.zero, style: .plain)
    var application:Application?
    
    var isLoading = false {
        didSet {
            tableView.reloadEmptyDataSet()
            config!.isLoading = isLoading
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        self.tableView.tableFooterView = UIView.init()
        
        
    }
    
    func configEmptyView(application: Application,viewController: UIViewController) -> Void {
        self.config = Configuration(application, controller: viewController)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        return cell!
    }
    
    
    //MARK: - DZNEmptyDataSetSource
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return config?.titleString
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return config?.detailString
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return config?.image
    }
    
    func imageAnimation(forEmptyDataSet scrollView: UIScrollView) -> CAAnimation? {
        return config?.imageAnimation
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        return config?.buttonTitle(state)
    }
 
    func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> UIImage? {
        return config?.buttonBackgroundImage(state)
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        return config?.backgroundColor
    }
    
//    func verticalOffset(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
//        return config!.verticalOffset
//    }
//
//    func spaceHeight(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
//       return config!.spaceHeight
//    }
    
    //MARK: - DZNEmptyDataSetDelegate Methods
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView) -> Bool {
        return isLoading
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.isLoading = false
        }
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.isLoading = false
        }
    }

}


extension BaseViewController{
    func setupNavigationItems() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.setNavigationBarHidden(false, animated: true)
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more"),
                                                                   target: self,
                                                                   action: #selector(loginBtnClick))
        }
    }
    
}

extension BaseViewController{
    @objc open func pressBack(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc open func loginBtnClick(){
        print("loginBtnClick")
    }
}
