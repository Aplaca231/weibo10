//
//  UIButton+Extension.swift
//  helloweibo
//
//  Created by Mac on 2018/12/1.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

extension UIButton{
    //便利构造函数  图像
    convenience init(imageName:String ,backImageName:String){
        self.init()
        
        setImage(UIImage(named:imageName), for: UIControlState.normal)
        setImage(UIImage(named:imageName+"_highlighted"), for: UIControlState.highlighted)
        setBackgroundImage(UIImage(named:backImageName), for: UIControlState.normal)
        setBackgroundImage(UIImage(named:backImageName+"_highlighted"), for: UIControlState.highlighted)
        
        sizeToFit()//会根据背景图片大小调整好尺寸
    }
    //按钮
    convenience init(title:String ,color:UIColor ,imageName:String ){
        self.init()
      
        setTitle(title, for: UIControlState.normal)
        setTitleColor(color, for: UIControlState.normal)
        setBackgroundImage(UIImage(named:imageName), for: UIControlState.normal)
     
    }
}
