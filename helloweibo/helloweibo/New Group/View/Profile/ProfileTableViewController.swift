//
//  ProfileTableViewController.swift
//  helloweibo
//
//  Created by Mac on 2018/11/30.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

class ProfileTableViewController: VisitorTableViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView?.setupInfo(imageName: "visitordiscover_image_profile", title: "登录后你的微博相册个人资料会显示在这里")
        
    }
    
}

