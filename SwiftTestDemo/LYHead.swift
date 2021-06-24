//
//  LYHead.swift
//  SwiftTestDemo
//
//  Created by liying on 2020/12/30.
//

import Foundation
import UIKit

//屏高

let kScreenHeight = UIScreen.main.bounds.size.height

//屏宽

let kScreenWidth = UIScreen.main.bounds.size.width

//iPhonex以上判断

let IS_IPhoneX_All = (kScreenHeight == 812 || kScreenHeight == 896 || kScreenHeight == 1218 || kScreenHeight == 1344 || kScreenHeight == 844 || kScreenHeight == 926)

//导航栏高

let HYDevice_NaviBar_Height = (IS_IPhoneX_All ? 88 : 64)

//状态栏高

let HYDevice_StatusBar_Height = (IS_IPhoneX_All ? 44 : 20)

//选项卡高

let HYDevice_TabBar_Height = (IS_IPhoneX_All ? 83 : 49)

//安全区高

let HYDevice_SafeArea_BottomHeight = (IS_IPhoneX_All ? 34 : 0)

/**宽度比例*/

func HYScaleWidth(_ font:CGFloat) -> (CGFloat) {

   return (kScreenWidth/375)*font

}

/**高度比例*/

func HYScaleHeight(_ font:CGFloat) -> (CGFloat) {

  return  kScreenHeight/667*font

}

/**字体比例*/

func HYScaleFont(_ font:CGFloat) -> (CGFloat) {

    return  kScreenWidth/375*font

}
