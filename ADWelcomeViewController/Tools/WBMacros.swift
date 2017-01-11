//
//  WBMacros.swift
//  WBDemo
//
//  Created by WangBao on 2016/11/4.
//  Copyright © 2016年 com.chinamworld. All rights reserved.
//

import UIKit

//屏幕宽度
let WBScreenWidth = UIScreen.main.bounds.width
//屏幕高度
let WBScreenHeight = UIScreen.main.bounds.height
// NSUserDefault
let userDefault = UserDefaults.standard


//屏幕尺寸
struct DeviceSzie {
    
    enum DeviceType {
        case iphone4
        case iphone5
        case iphone6
        case iphone6p
    }
    
    //判断屏幕类型
    static func currentSize() -> DeviceType {
        switch (WBScreenWidth, WBScreenHeight) {
        case (320, 480),(480, 320):
            return .iphone4
        case (320, 568),(568, 320):
            return .iphone5
        case (375, 667),(667, 375):
            return .iphone6
        case (414, 736),(736, 414):
            return .iphone6p
        default:
            return .iphone6
        }
    }
}
