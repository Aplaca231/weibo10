//
//  HomeTableViewController.swift
//  helloweibo
//
//  Created by Mac on 2018/11/30.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

class HomeTableViewController: VisitorTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView?.setupInfo(imageName: nil, title: "关注一些人，回这里看看有什么新的惊喜")
      
    }

}
