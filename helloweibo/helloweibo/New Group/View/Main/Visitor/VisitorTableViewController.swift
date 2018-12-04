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
        //设置代理
       // visitorView?.delegate = self
        view = visitorView
        //添加监听方法
        visitorView?.registerButton.addTarget(self, action: #selector(VisitorTableViewController.visitorViewDidRegister), for: UIControlEvents.touchUpInside)
        visitorView?.loginButton.addTarget(self, action: #selector(VisitorTableViewController.visitorViewDidLogin), for: UIControlEvents.touchUpInside)
       // view.backgroundColor = UIColor.orange
       
        
        //设置导航栏
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action:#selector(VisitorTableViewController.visitorViewDidRegister))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action:#selector(VisitorTableViewController.visitorViewDidLogin))
        
    }
}

//MARK: -访客视图 监听方法
extension VisitorTableViewController{
   @objc func visitorViewDidRegister() {
        print("注册")
    }
   @objc func visitorViewDidLogin() {
        let vc = OAuthViewController()
        let nav  = UINavigationController(rootViewController :vc)
        present(nav, animated: true, completion: nil)
    }
}

