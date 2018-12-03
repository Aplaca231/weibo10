//
//  NetworkTools.swift
//  helloweibo
//
//  Created by Mac on 2018/12/3.
//  Copyright © 2018年 www.alpaca.com. All rights reserved.
//

import UIKit
import AFNetworking
//枚举类型
enum WBHTTPMethod {
    case GET
    case POST
}
//MARK: -网络工具
class NetworkTools: AFHTTPSessionManager {

    //建立单例
    static let sharedTools:NetworkTools = {
        let tools = NetworkTools(baseURL:nil)
        //tools.requestSerializer.acceptableContentTypes?.insert("text/heml")
        return tools
    }()
    
    
}


//MARK: -封装AFN网络方法
extension NetworkTools {
    /// 封装AFN 的的GET /POST请求
    ///
    /// - parameter method:     GET /POST
    /// - parameter URLString:  URLString
    /// - parameter parameters: 参数字典
    /// - parameter completion: 回调json、是否成功
    func request(method: WBHTTPMethod = .GET, URLString: String, parameters: [String:AnyObject]?, completion: @escaping (_ json: AnyObject?,_ isSuccess: Bool) ->Void) {
        
        //成功回调
        let success = {(task: URLSessionDataTask, json: Any?) ->() in
            completion(json as AnyObject?, true)
        }
        //失败回调
        let failure = {(task: URLSessionDataTask?, error: Error) ->() in
            
            //针对 403 处理token 过期
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: YWUserShouldLoginNotification), object: "bad Token", userInfo: nil)
            }
            print("网络请求错误\(error)")
            completion(nil, false)
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }else{
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
}

    

