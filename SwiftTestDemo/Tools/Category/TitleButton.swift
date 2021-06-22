//
//  TitleButton.swift
//  SwiftTestDemo
//
//  Created by liying on 2021/1/12.
//

import UIKit

class TitleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(named: "140_filter_arrow_nor"), for: .normal)
        setImage(UIImage(named: "140_filter_arrow_sel"), for: .selected)
        setTitleColor(UIColor.black, for: .normal)
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.x = titleLabel!.frame.size.width + 5
    }
}
