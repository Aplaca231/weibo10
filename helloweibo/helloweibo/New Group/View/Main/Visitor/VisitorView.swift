//
//  VisitorView.swift
//  helloweibo
//
//  Created by Mac on 2018/12/1.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit
//protocol VisitorViewDelegate: NSObjectProtocol {
//    //注册
//    func visitorViewDidRegister()
//    //登录
//    func visitorViewDidLogin()
//
//}
///访客视图 - 处理用户未登录界面显示
class VisitorView: UIView {
    ///代理
//    weak var delegate : VisitorViewDelegate?
//    //MARK: - 监听方法
//    @objc private func clickLogin(){
//        delegate?.visitorViewDidLogin()
//    }
//    @objc private func clickRegister(){
//        delegate?.visitorViewDidRegister()
//    }
    
    //MARK :-设置视图信息
    func setupInfo(imageName:String?,title:String){
        messageLabel.text = title
        guard let imgName = imageName else {
            startAnim()
            return
        }
        
        iconView.image = UIImage(named:imgName)
        //隐藏小房子
        homeView.isHidden=true
        //
        maskIconView.isHidden=true
        }
    
    //首页旋转
    private func startAnim(){
        let anim = CABasicAnimation.init(keyPath: "transform.rotation")
        anim.toValue = 2*Double.pi
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        //不断重复的动画
        anim.isRemovedOnCompletion = false
        iconView.layer.add(anim, forKey: nil)

    }
    //纯代码开发入
    override init(frame:CGRect) {
        super.init(frame:frame)
        setupUI()
    }
    //initwithcoder    使用设备sb  xib开发入口
    required init?(coder aDecoder: NSCoder) {
        //组织使用SB  使用当前自定义视图
      //  fatalError("init(coder:) has not been implemented")
    super.init(coder: aDecoder)
    setupUI()
    }
    //MARK:-懒加载控件
    private lazy var iconView :UIImageView=UIImageView(imageName:"visitordiscover_feed_image_smallicon")//旋转图标
    private lazy var maskIconView: UIImageView = UIImageView(imageName:"visitordiscover_feed_mask_smallicon")//遮罩图片
    private lazy var homeView :UIImageView=UIImageView(imageName:"visitordiscover_feed_image_house")//小房子
    private lazy var messageLabel :UILabel = UILabel(title: "关于一些人，回这里看看有什么惊喜", fontSize: 14, COLOR: UIColor.darkGray)//标签
    lazy var registerButton:UIButton=UIButton(title:"注册",color:UIColor.orange,imageName:"common_button_white_disable")//注册按钮
    lazy var loginButton:UIButton=UIButton(title:"登录",color:UIColor.darkGray,imageName:"common_button_white_disable")//登录按钮
}

extension VisitorView{
    ///设置界面
    private func setupUI(){
        //1添加控件
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeView)
        addSubview(messageLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        //2设置自动布局
        //添加约束  到父视图   子视图最好有一个统一的参照物
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false//为了设置自动布局
        }
        //1>图标
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        //1>小房子
        addConstraint(NSLayoutConstraint(item: homeView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: homeView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))
        //3>消息文字
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .top, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 224))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        //4>注册按钮
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .left, relatedBy: .equal, toItem: messageLabel, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .top, relatedBy: .equal, toItem: messageLabel, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant:100))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        //5>登录按钮
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .right, relatedBy: .equal, toItem: messageLabel, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: messageLabel, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant:100))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        //6>遮罩图像//VFL可视化格式语言
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .bottom, relatedBy: .equal, toItem: registerButton, attribute: .top, multiplier: 1.0, constant: -20))
        
        //设置背景颜色 灰度图R=G=B  大多数都使用
        backgroundColor = UIColor(white:237.0/255.0,alpha:1.0)
        
        
        //3添加监听方法
//        registerButton.addTarget(self, action: #selector(VisitorView.clickRegister), for: UIControlEvents.touchUpInside)
//        loginButton.addTarget(self, action: #selector(VisitorView.clickLogin), for: UIControlEvents.touchUpInside)
//        
        
    }
}
