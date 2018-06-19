//
//  RequestTool.swift
//  WeiChat
//
//  Created by DragonLi on 2017/8/29.
//  Copyright © 2017年 XiTu Inc. All rights reserved.
//

import Alamofire


class RequestTool {

    private let testAPIURL = "http://api.budejie.com/api/api_open.php?a=list&c=data"

    /// load test demo datas
    ///
    /// - Parameter complete: callblock
    
    /*
     1. Swift3.0+:非逃逸闭包，if closure:函数执行完以后再调用的(逃逸闭包) 就需要用 @escaping修饰
     2. 一个文件作为一个模块被导入的话，通过文件名就能访问到模块内部的数据，比如说通过cocopods导入的框架，就有这样的特性。
     3. 如果把Alamofire.swift直接拖进工程中，Alamofire.requeset()就会报错，但是我们去掉Alamofire，直接用request()就可以了。()
     */
    
    func loadListDemoDatas( complete:@escaping (_ dic:AnyObject) ->() ){
        
        //     默认的响应会放在主线程 ====>>>  自定义响应线程
        let networkingQueue = DispatchQueue.global(qos: .utility)
        
        Alamofire.request(testAPIURL).responseJSON (queue: networkingQueue){ response in   // return self
            // response.request ---> original URL request
            // response.response  --->HTTP URL response
            // response.data    ---> server back  datas
            // response.result   ---> result of response serialization  // serialization
            print( Thread.current)
            if let JSON = response.result.value {  // 如果是被序列化的数据，就通过resonse中的result.value来获取数据
                complete(JSON as AnyObject)
                /*
                 response 直接返回HTTPResponse，未序列化
                 responseData 序列化为Data
                 responseJSON 序列化为JSON
                 responseString 序列化为字符串
                 responsePropertyList 序列化为Any
                 */
                
            }
        }
    }
    
}

