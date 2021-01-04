//
//  HomeBaseCollectionViewCell.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2020/12/31.
//

import UIKit

class HomeBaseCollectionViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    var title = UILabel()
    var button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        title.textColor = UIColor.init(hex: "#ffffff")
        title.text = "标题"
        title.textAlignment = .center
        let R = (arc4random()%256)
        let G = (arc4random()%256)
        let B = (arc4random()%256)
        imageView.backgroundColor = UIColor(red: CGFloat(R)/256, green: CGFloat(G)/256, blue: CGFloat(B)/256, alpha: 1)
        button.setTitle("点我", for: .normal)
        button.setTitleColor(UIColor.init(hex: "#2A8DFF"), for: .normal)
        
        
        self.contentView.addSubview(imageView)
        imageView.addSubview(title)
        self.contentView.addSubview(button)
        
        imageView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(self.contentView).offset(0)
            make.height.equalTo(snp_width)
            
        }
        title.snp_makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(5);
            make.right.equalTo(self.contentView).offset(-5);
            make.top.equalTo(self.imageView).offset(5);
        }
        button.snp_makeConstraints { (make) in
            make.bottom.right.equalTo(self.contentView).offset(-5);
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
