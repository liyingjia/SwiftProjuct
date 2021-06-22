//
//  HomeBaseCollectionViewCell.swift
//  SwiftTestDemo
//
//  Created by liying on 2020/12/31.
//

import UIKit

class HomeBaseCollectionViewCell: UICollectionViewCell {
    let backView = UIView()
    
    var imageView = UIImageView()
    var title = UILabel()
    var button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backView.backgroundColor = UIColor.white
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        
        
        title.textColor = UIColor.init(hex: "#2B3141")
        title.text = "标题"
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.textAlignment = .center
        let R = (arc4random()%256)
        let G = (arc4random()%256)
        let B = (arc4random()%256)
        imageView.backgroundColor = UIColor(red: CGFloat(R)/256, green: CGFloat(G)/256, blue: CGFloat(B)/256, alpha: 1)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        
        button.setTitle("¥700.06", for: .normal)
        button.setTitleColor(UIColor.init(hex: "#46BC25"), for: .normal)
        button.titleLabel?.font = UIFont.italicSystemFont(ofSize: 13)
        
        self.contentView.addSubview(backView)
        backView.addSubview(imageView)
        backView.addSubview(title)
        backView.addSubview(button)
        
        backView.snp_makeConstraints { (make) in
            make.top.left.equalTo(self.contentView).offset(5)
            make.right.bottom.equalTo(self.contentView).offset(0)
        }
        
        imageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(backView).offset(0)
            make.top.equalTo(backView).offset(10)
            make.height.width.equalTo(50)
            
        }
        title.snp_makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(5);
            make.right.equalTo(self.contentView).offset(-5);
            make.top.equalTo(self.imageView.snp_bottom).offset(8);
        }
        button.snp_makeConstraints { (make) in
            make.top.equalTo(title.snp_bottom).offset(5);
            make.centerX.equalTo(backView).offset(0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
