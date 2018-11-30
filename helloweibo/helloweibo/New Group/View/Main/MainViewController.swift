//
//  MainViewController.swift
//  helloweibo
//
//  Created by Mac on 2018/11/30.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildViewControllers()//添加控制器不会创建按钮   懒加载无处不在
        
        setupComposeButton()
    }
    
    
    //MARK  懒加载控件
    private lazy var composedButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"tabbar_compose_icon_add"), for: UIControlState.normal)
         button.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        button.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: UIControlState.normal)
        button.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        button.sizeToFit()//会根据背景图片大小调整好尺寸
        return button
    }()
}

   //mark  设置界面

extension MainViewController{//设置界面
    
    private func setupComposeButton(){
        //添加按钮
        tabBar.addSubview(composedButton)
        //调整按钮
        let count = childViewControllers.count
        let w = tabBar.bounds.width/CGFloat(count)
        
        composedButton.frame = composedButton.frame.insetBy(dx:2*w,dy:0)
        
        
        
        
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
    //添加控制器
    
    private func addChildViewController(vc :UIViewController,title :String ,imageName:String){
        let vc = HomeTableViewController()
        //设置标题  由内至外设置
        vc.title=title
        //设置图像
        vc.tabBarItem.image = UIImage(named:imageName)
        //导航控制器
        let nav = UINavigationController(rootViewController :vc)
        
        addChildViewController(nav)
        
    }
    }


