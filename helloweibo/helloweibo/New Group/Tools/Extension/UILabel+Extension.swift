//
//  UILabel+Extension.swift
//  helloweibo
//
//  Created by Mac on 2018/12/2.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

extension UILabel{
    //便利构造函数  标签
    convenience  init(title:String,fontSize:CGFloat=14,COLOR:UIColor=UIColor.darkGray){
        self.init()
        text = "关于一些人，回这里看看有什么惊喜"
        textColor = UIColor.darkGray
        font = UIFont.systemFont(ofSize: 14)
        numberOfLines = 0
        textAlignment = NSTextAlignment.center
        
    }
}
