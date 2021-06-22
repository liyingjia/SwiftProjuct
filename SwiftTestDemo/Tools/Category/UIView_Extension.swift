//
//  UIView_Extension.swift
//  SwiftTestDemo
//
//  Created by liying on 2021/3/31.
//

import Foundation

extension UIView{
    func setCornersRadius(_ view: UIView!, radius: CGFloat, roundingCorners: UIRectCorner) {
            if view == nil {
                return
            }
            let maskPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = view.bounds
            maskLayer.path = maskPath.cgPath
            maskLayer.shouldRasterize = true
            maskLayer.rasterizationScale = UIScreen.main.scale
            
            view.layer.mask = maskLayer
        }

}
