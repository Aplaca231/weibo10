//
//  MessageTableViewController.swift
//  helloweibo
//
//  Created by Mac on 2018/11/30.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

class MessageTableViewController: VisitorTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView?.setupInfo(imageName: "visitordiscover_image_message",title: "登陆后打开微博都会在这里收到通知  ")
        
    }
    
}

