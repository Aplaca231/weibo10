//
//  MainViewController.swift
//  helloweibo
//
//  Created by Mac on 2018/11/30.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    //MARK: 监听方法
    //如果只‘单纯’使用private 运行循环将无法正确发送消息  导致崩溃
    //如果使用@objc 修饰符号  可以保证发送消息   及时函数被标记为private
    //保护住方法
    
    @objc private func clickComposedButton(){
        print("点我了")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildViewControllers()//添加控制器不会创建按钮   懒加载无处不在
        
        setupComposeButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //将撰写按钮放到最前面
        tabBar.bringSubview(toFront: composedButton)
    }

    
    
    //MARK:懒加载控件
    private lazy var composedButton:UIButton = UIButton(imageName: "tabbar_compose_icon_add", backImageName: "tabbar_compose_button")

}

   //mark  设置界面

extension MainViewController{//设置界面
    ///设置撰写按钮
    private func setupComposeButton(){
        //添加按钮
        tabBar.addSubview(composedButton)
        //调整按钮
        let count = childViewControllers.count
        let w = tabBar.bounds.width/CGFloat(count)-1//让按钮宽一点  解决手指触摸容错
        composedButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        //添加监听方法
        composedButton.addTarget(self, action: #selector(MainViewController.clickComposedButton), for:UIControlEvents.touchUpInside)
        
        
        
    }
    private func addChildViewControllers(){
        //设置tintColor 图片渲染颜色    如果能用颜色  不建议使用图片  可以提升性能
        tabBar.tintColor = UIColor.orange
        addChildViewController(vc: HomeTableViewController(),title:"首页",imageName:"tabbar_home")
         addChildViewController(vc: MessageTableViewController(),title:"消息",imageName:"tabbar_message_center")
        
        
        addChildViewController(UIViewController())
         addChildViewController(vc: DiscoverTableViewController(),title:"发现",imageName:"tabbar_discover")
         addChildViewController(vc: ProfileTableViewController(),title:"我",imageName:"tabbar_profile")
    }
    ///添加控制器
    
    private func addChildViewController(vc :UIViewController,title :String ,imageName:String){
       
        //设置标题  由内至外设置
        vc.title=title
        //设置图像
        vc.tabBarItem.image = UIImage(named:imageName)
        //导航控制器
        let nav = UINavigationController(rootViewController :vc)
        
        addChildViewController(nav)
        
    }
    }


