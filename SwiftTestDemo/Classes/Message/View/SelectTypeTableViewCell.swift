//
//  SelectTypeTableViewCell.swift
//  SwiftTestDemo
//
//  Created by liying on 2021/3/31.
//

import UIKit

class SelectTypeTableViewCell: UITableViewCell {
    
    var selectAllBtn:UIButton = UIButton()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        selectAllBtn.setTitle("规格1：箱盒(5.0盒/箱)", for: .normal)
        selectAllBtn.contentHorizontalAlignment = .left
        selectAllBtn.setImage(UIImage(named: "selected_nor"), for: .normal)
        selectAllBtn.setImage(UIImage(named: "selected_sel"), for: .selected)
        selectAllBtn.setTitleColor(UIColor.init(hex: "#66697D"), for: .normal)
        selectAllBtn.addTarget(self, action: #selector(selectAllBtnClick), for: .touchUpInside)
        selectAllBtn.ly_setImagePosition(.left, spaceing: 5)
        
        self.contentView.addSubview(selectAllBtn)
        selectAllBtn.snp_makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(60)
            make.right.equalTo(self.contentView).offset(-15)
            make.centerY.equalTo(self.contentView)
        })
        
    }
    
    @objc func selectAllBtnClick(){
       self.selectAllBtn.isSelected = !self.selectAllBtn.isSelected
        
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
}


