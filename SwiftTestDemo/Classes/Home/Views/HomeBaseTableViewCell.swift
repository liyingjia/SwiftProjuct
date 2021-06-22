//
//  HomeBaseTableViewCell.swift
//  SwiftTestDemo
//
//  Created by liying on 2020/12/30.
//

import UIKit
import Hue

class HomeBaseTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var titleLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "HomeBaseTableViewCell")
        nameLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        nameLabel.textColor = UIColor.init(hex: "#2A8DFF")
        self.contentView.addSubview(nameLabel)
        nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.top.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-15)
        }
        titleLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        titleLabel.numberOfLines = 0
        self.contentView.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.top.equalTo(nameLabel.snp_bottom).offset(15)
            make.right.bottom.equalTo(self.contentView).offset(-15)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
