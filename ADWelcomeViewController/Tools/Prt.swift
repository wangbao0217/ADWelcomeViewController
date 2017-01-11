//
//  Prt.swift
//  WBDemo
//
//  Created by WangBao on 2016/11/16.
//  Copyright © 2016年 com.chinamworld. All rights reserved.
//

import UIKit


class Prt: NSObject {
    
    
    ///打印Debug信息
    /**
     msg:传进来的字符串
     */
    ///备注:
    public static func d<T>(msg: T,
                         file: String = #file,
                         method: String = #function,
                         line: Int = #line) {
        /* 条件编译，更详细的内容见：http://stackoverflow.com/questions/24003291/ifdef-replacement-in-swift-language
        1. 在项目的Build Settings里配置Swift Compiler - Custom Flags，展开Other Swift Flags，在Debug右侧输入“-DDEBUG”。也可以“-D DEBUG”，但是不能有赋值，如：“-DDEBUG=1” 或 “-D DEBUG=1”都是无效的。
        2. 在项目的Build Settings里配置Apple LLVM x.x - Preprocessiong，展开Preprocessor Macros，在Debug右侧默认包含“DEBUG=1”，若没有请手动加入。
        3. 设置DEBUG模式或RELEASE模式下运行代码以打开或关闭。
        说明：第1步使Swift代码编译Debug时定义DEBUG标记，第2步使Objective-C、C、C++的LLVM预处理在Debug时定义DEBUG=1宏标记。如果是纯Swift工程可以忽略第2步。*/
        #if DEBUG
            print("[DEBUG]: \((file as NSString).lastPathComponent)[\(line)], \(method): \(msg)")
        #endif
    }
    
    
    ///打印Info信息
    /**
     msg:传进来的字符串
     */
    ///备注:
    public static func i<T>(msg: T,
                         file: String = #file,
                         method: String = #function,
                         line: Int = #line) {
                   print("[INFO ]: \((file as NSString).lastPathComponent)[\(line)], \(method): \(msg)")

    }
    
    ///打印ERROR信息
    /**
     msg:传进来的字符串
     */
    ///备注:
    public static func e<T>(msg: T,
                         file: String = #file,
                         method: String = #function,
                         line: Int = #line) {
        print("[ERROR]: \((file as NSString).lastPathComponent)[\(line)], \(method): \(msg)")
        
    }


}


