//
//  SelectTypeHeadView.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2021/3/31.
//

import UIKit

class SelectTypeHeadView: UIView {

    var selectAllBtn:UIButton = {
        let selectAllBtn = UIButton()
        selectAllBtn.setTitle("售卖方式1(箱/盒)", for: .normal)
        selectAllBtn.contentHorizontalAlignment = .left
        selectAllBtn.setImage(UIImage(named: "selected_nor"), for: .normal)
        selectAllBtn.setImage(UIImage(named: "selected_sel"), for: .selected)
        selectAllBtn.setTitleColor(UIColor.init(hex: "#2B3141"), for: .normal)
        selectAllBtn.addTarget(self, action: #selector(selectAllBtnClick), for: .touchUpInside)
        selectAllBtn.ly_setImagePosition(.left, spaceing: 5)
        return selectAllBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension SelectTypeHeadView{
    
    func configUI() {
        self.addSubview(self.selectAllBtn)
        self.selectAllBtn.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.centerY.equalTo(self)
        }
    }
    
    @objc func selectAllBtnClick(){
        self.selectAllBtn.isSelected = !self.selectAllBtn.isSelected
    }
}
