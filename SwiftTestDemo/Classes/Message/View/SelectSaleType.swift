//
//  SelectSaleType.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2021/3/31.
//

import UIKit

class SelectSaleType: UIView,UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTypeTableViewCell", for: indexPath) as! SelectTypeTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView:SelectTypeHeadView = SelectTypeHeadView.init(frame: CGRect(x:0,y:0,width: kScreenWidth,height: 40))
        return headView
    }
    
    var headView:UIView = UIView.init(frame: CGRect(x:0,y:0,width: kScreenWidth,height: 0.1))
    

    var tableView:UITableView = {
        var tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.register(SelectTypeTableViewCell.classForCoder(), forCellReuseIdentifier: "SelectTypeTableViewCell")
        tableView.tableFooterView = UIView()
       return tableView
   }()
    var deleteBtn:UIButton = {
       let deleteBtn = UIButton()
       deleteBtn.setImage(UIImage(named: "deleteimage"), for: .normal)
        deleteBtn.addTarget(self, action: #selector(deleteBtnClick), for: .touchUpInside)
       return deleteBtn
   }()
   var headImage:UIImageView = {
    let headImage = UIImageView()
    headImage.backgroundColor = UIColor.yellow
    return headImage
   }()
   var headName:UILabel = {
    let headName = UILabel()
    headName.text = "西州蜜瓜"
    return headName
   }()
    var selectAllBtn:UIButton = {
        let selectAllBtn = UIButton()
        selectAllBtn.setTitle("全选", for: .normal)
        selectAllBtn.setImage(UIImage(named: "selected_nor"), for: .normal)
        selectAllBtn.setImage(UIImage(named: "selected_sel"), for: .selected)
        selectAllBtn.addTarget(self, action: #selector(selectAllBtnClick), for: .touchUpInside)
        selectAllBtn.setTitleColor(UIColor.black, for: .normal)
        selectAllBtn.ly_setImagePosition(.left, spaceing: 5)
        return selectAllBtn
    }()
    
    var sureBtn:UIButton = {
        let sureBtn = UIButton()
        sureBtn.backgroundColor = UIColor.blue
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.gradientButton(with: CGSize.init(width: 140, height: 45), colorArray: [UIColor.init(hex: "#2A8DFF"),UIColor.init(hex: "#0D5DFE")], percentageArray: [0,1], gradientType: .GradientFromLeftToRight)
        return sureBtn
    }()
    
    
    
    var lineView:UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.init(hex: "#F5F6FA")
        return lineView
    }()
    
    @objc func deleteBtnClick(){
        self.tf_hide()
    }
    
    @objc func selectAllBtnClick(){
        self.selectAllBtn.isSelected = !self.selectAllBtn.isSelected
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.sureBtn.setCornersRadius(self.sureBtn, radius: 22.5, roundingCorners: [.topLeft,.bottomLeft,.topRight,.bottomRight])
        self.headImage.setCornersRadius(self.headImage, radius: 10, roundingCorners: [.topLeft,.bottomLeft,.topRight,.bottomRight])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SelectSaleType{
    func configUI() {
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 15
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableHeaderView = self.headView
        self.addSubview(self.tableView)
        self.addSubview(self.deleteBtn)
        self.addSubview(self.headImage)
        self.addSubview(self.headName)
        self.addSubview(self.lineView)
        self.addSubview(self.selectAllBtn)
        self.addSubview(self.sureBtn)
        
        self.headImage.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(25)
            make.left.equalTo(self).offset(25)
            make.height.width.equalTo(50)
        }
        self.headName.snp_makeConstraints { (make) in
            make.centerY.equalTo(self.headImage)
            make.left.equalTo(self.headImage.snp_right).offset(15)
        }
        self.deleteBtn.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.height.width.equalTo(40)
        }
        self.lineView.snp_makeConstraints { (make) in
            make.top.equalTo(self.headImage.snp_bottom).offset(15)
            make.left.right.equalTo(self)
            make.height.equalTo(1)
        }
        self.selectAllBtn.snp_makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-HYDevice_TabBar_Height-15)
            make.left.equalTo(self).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }
        self.sureBtn.snp_makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-HYDevice_TabBar_Height-15)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(45)
            make.width.equalTo(140)
        }
        
        self.tableView.snp_makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.lineView.snp_bottom).offset(0)
            make.bottom.equalTo(self.selectAllBtn.snp_top).offset(-10)
        }
        
        
        
    }
    

}
