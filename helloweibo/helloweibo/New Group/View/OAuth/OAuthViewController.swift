//
//  OAuthViewController.swift
//  helloweibo
//
//  Created by Mac on 2018/12/4.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {
    private lazy var webView = UIWebView()
    //MARK: -监听方法
    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }
    
    ///自动填充用户名和密码  -web 注入
    @objc private func autoFill(){
        let js = "document.getElementById('userId').value = '13093627213';" +
        "document.getElementById('passwd').value = 'Taylor19891213x'"
        webView.stringByEvaluatingJavaScript(from: js)
    }
    //MARK: -设置界面
    override func loadView() {
        view = webView
        //设置代理
        webView.delegate = self
        //设置导航栏
        title = "登录新浪微博"
        navigationItem.leftBarButtonItem =  UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: .plain, target: self, action: #selector(autoFill))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //view.backgroundColor = UIColor.white
        //加载页面
        self.webView.loadRequest(NSURLRequest(url: NetworkTools.sharedTools.oauthURL as URL) as URLRequest)

        // Do any additional setup after loading the view.
    }

}
//MARK: -UIWebViewDelegate
extension OAuthViewController:UIWebViewDelegate{
    //将要加载的请求方法
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        //如果是百度就不加载
        guard let url = request.url, url.host == "www.baidu.com" else{
            return true
        }
        //2从百度地址提取code=是否存在
        guard let query = url.query,query.hasPrefix("code=") else {
            print("取消授权")
            return false
        }
        //3从query字符串中提取code=后面的授权码
        let code = String(query["code=".endIndex...])
        print(query)
        print("授权码是" + code)
        //4  加载accessToken
        NetworkTools.sharedTools.loadAccessToken(code: code) { (result, success) in
            if success==nil{
               print("出错了")
            }
            print(result!)
            return
        }
        
        return false
     
    }
}
