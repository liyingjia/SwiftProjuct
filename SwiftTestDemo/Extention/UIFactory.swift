//
//  UIFactory.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2021/6/23.
//

import UIKit

class UIFactory: NSObject {
    
    //创建UIView
   class func view(WithFrame frame:CGRect,bgColor:UIColor) -> UIView {
        let view = UIView(frame: frame)
        view.backgroundColor = bgColor
        return view
    }
    //创建label
    class func label(withFrame frame: CGRect, text: String?, textColor: UIColor?, font: UIFont?, bgColor: UIColor?) -> UILabel? {
        let label = UILabel(frame: frame)
        label.text = text
        label.font = font
        label.textAlignment = .left
        label.backgroundColor = bgColor
        label.textColor = textColor
        if bgColor == nil {
            label.backgroundColor = UIColor.white
        }
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        return label
    }
    
    //创建textView
    class func textView(withFrame frame:CGRect, text:String?, textColor:UIColor?, font:UIFont?, bgColor:UIColor?) -> UITextView? {
        let textView = UITextView(frame: frame)
        textView.text = text
        textView.font = font
        textView.textAlignment = NSTextAlignment.center
        textView.textColor = textColor
        textView.backgroundColor = bgColor
        return textView
    }
    //创建Button--图片
    class func button(withFrame frame: CGRect, title: String?, font: UIFont?, titleColorNormal: UIColor?, bgImageNormal: UIImage?, bgImageHighlighted: UIImage?, target: Any?, touchAction action: Selector) -> UIButton? {
        let button = UIButton(type: .custom)
        button.frame = frame
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColorNormal, for: .normal)
        button.titleLabel?.font = font
        button.setBackgroundImage(bgImageNormal, for: .normal)
        button.setBackgroundImage(bgImageHighlighted, for: .highlighted)
        button.setBackgroundImage(bgImageHighlighted, for: .selected)
        if target != nil {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        return button
    }
    //创建Button--文字
    class func button(withFrame frame: CGRect, title: String?, font: UIFont?, titleColorNormal: UIColor?, titleColorSelected: UIColor?, target: Any?, touchAction action: Selector) -> UIButton? {
        let button = UIButton(type: .custom)
        button.frame = frame
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColorNormal, for: .normal)
        button.setTitleColor(titleColorSelected, for: .selected)
        button.titleLabel?.font = font
        if target != nil {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        return button
    }
}
