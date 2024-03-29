//
//  BaseNavViewController.swift
//  CloudscmSwift
//
//  Created by Darren on 17/5/2.
//  Copyright © 2017年 RexYoung. All rights reserved.
//

import UIKit

class CLBaseImagePickerViewController: UIViewController {
    
    // 自定义导航栏
    lazy var customNavBars: CustomNavgationView = {
        let nav = CustomNavgationView()
        return nav
    }()
        
    
    // 右边第一个按钮
    lazy var rightBtn: UIButton = {
        let btn = UIButton()
        btn.adjustsImageWhenHighlighted = false
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(CLBaseImagePickerViewController.rightBtnClick), for: UIControl.Event.touchUpInside)
        return btn
    }()
    // 标题
    var navTitle = "" {
        didSet{
            customNavBars.titleLable.text = navTitle
        }
    }
    // 返回按钮
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        btn.setImage(UIImage(named: "icn_icn_back_white", in: BundleUtil.getCurrentBundle(), compatibleWith: nil), for:UIControl.State())
        btn.addTarget(self, action: #selector(CLBaseImagePickerViewController.backBtnclick), for: .touchUpInside)
        return btn
    }()
    
    lazy var toobar: UIToolbar = {
        // 添加磨玻璃
        let toolBar = UIToolbar.init()
        toolBar.barStyle = .default
        return toolBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.setupNav()
        initLayout()
    }
    
    func initLayout() {
        let titleY: CGFloat = UIDevice.id_isX() == true ? 40:20

        self.customNavBars.translatesAutoresizingMaskIntoConstraints = false
        self.toobar.translatesAutoresizingMaskIntoConstraints = false
        self.rightBtn.translatesAutoresizingMaskIntoConstraints = false
        self.backBtn.translatesAutoresizingMaskIntoConstraints = false

        // 导航栏
        self.customNavBars.addConstraint(NSLayoutConstraint.init(item: self.customNavBars, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: KNavgationBarHeight))
        self.view.addConstraints([
            NSLayoutConstraint.init(item: self.customNavBars, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.customNavBars, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.customNavBars, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
            ])
        // toolbar
        self.toobar.addConstraint(NSLayoutConstraint.init(item: self.toobar, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: KNavgationBarHeight))
        self.customNavBars.addConstraints([
            NSLayoutConstraint.init(item: self.toobar, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBars, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.toobar, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBars, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.toobar, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBars, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
            ])
        // 右边的按钮
        self.rightBtn.addConstraint(NSLayoutConstraint.init(item: self.rightBtn, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 44))
        self.rightBtn.addConstraint(NSLayoutConstraint.init(item: self.rightBtn, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 64))
        self.customNavBars.addConstraints([
            NSLayoutConstraint.init(item: self.rightBtn, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBars, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: titleY),
            NSLayoutConstraint.init(item: self.rightBtn, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBars, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
            ])
        
        // 返回按钮
        self.backBtn.addConstraint(NSLayoutConstraint.init(item: self.backBtn, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 44))
        self.backBtn.addConstraint(NSLayoutConstraint.init(item: self.backBtn, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 50))
        self.customNavBars.addConstraints([
            NSLayoutConstraint.init(item: self.backBtn, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBars, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: titleY),
            NSLayoutConstraint.init(item: self.backBtn, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBars, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
            ])
    }
    
    // 先不要写在initview中，因为如果写在initview中就需要在子类中必须实现initView方法，并且调用super.initView()
    fileprivate func setupNav(){
        // 添加导航栏
        self.view.addSubview(self.customNavBars)
        // 右边按钮
        self.customNavBars.addSubview(self.rightBtn)
        
        // 毛玻璃效果
        self.customNavBars.addSubview(self.toobar)
        self.customNavBars.sendSubviewToBack(self.toobar)
        
        self.customNavBars.addSubview(self.backBtn)
        self.backBtn.isHidden = true
        
        // 设置位置，适配iphonex
        let titleY: CGFloat = UIDevice.id_isX() == true ? 40:20
        self.rightBtn.cl_y = titleY
        self.backBtn.cl_y = titleY
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if CLPickersTools.instence.navColor == nil {
            self.toobar.isHidden = false
            self.customNavBars.backgroundColor = UIColor.clear
        } else {
            self.customNavBars.backgroundColor = CLPickersTools.instence.navColor
            self.toobar.isHidden = true
        }
        
        if CLPickersTools.instence.navTitleColor != nil {
            self.backBtn.imageView?.tintColor = CLPickersTools.instence.navTitleColor
            let img = self.backBtn.image(for: .normal)?.withRenderingMode(.alwaysTemplate)
            self.backBtn.setImage(img, for: .normal)
            
            self.customNavBars.titleLable.textColor = CLPickersTools.instence.navTitleColor
            self.rightBtn.setTitleColor(CLPickersTools.instence.navTitleColor, for: .normal)
        } else {
            self.backBtn.imageView?.tintColor = UIColor.black
            let img = self.backBtn.image(for: .normal)?.withRenderingMode(.alwaysTemplate)
            self.backBtn.setImage(img, for: .normal)
            
            self.customNavBars.titleLable.textColor = UIColor.black
            self.rightBtn.setTitleColor(UIColor.black, for: .normal)
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if  CLPickersTools.instence.statusBarType == .black {
            return .default
        }
        return .lightContent
    }
    @objc func rightBtnClick(){
        
    }
    @objc func backBtnclick(){
        
    }
}

