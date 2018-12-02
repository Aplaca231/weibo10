//
//  UIImage+Extension.swift
//  helloweibo
//
//  Created by Mac on 2018/12/2.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit
extension UIImageView{
    //图片便利构造函数
    convenience init(imageName:String){
     self.init(image: UIImage(named:imageName))
    }
}
