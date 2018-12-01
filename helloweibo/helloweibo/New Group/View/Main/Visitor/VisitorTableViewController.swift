//
//  VisitorTableViewController.swift
//  helloweibo
//
//  Created by Mac on 2018/12/1.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

class VisitorTableViewController: UITableViewController {
    ///用户登录标记
    private var userLogon = false
    var visitorView:VisitorView?//访客视图
    override func loadView() {
        
        //根据用户登录情况  决定视图
        userLogon ? super.loadView():setupVisitorView()
        
    }
    ///设置访客视图
    private func setupVisitorView(){
        //替换根视图
        visitorView = VisitorView()
        view = visitorView
       // view.backgroundColor = UIColor.orange
    }
}



