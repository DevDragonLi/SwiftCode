//
//  ViewController.swift
//  swift01
//
//  Created by DragonLi on 2016/12/9.
//  Copyright © 2016年 DragonLi. All rights reserved.
//

import UIKit
/**
 1. Swift中如果多个语句并列，可以使用分号
 2. 更多类似java等语言的()调用形式或者.语法 eg:UIColor.red
 3. 枚举直接.后面枚举类型,输出采用print()
 4. 添加监听方法对比
 OC早期语言使用@       -->  @selector
 Swift提示不行,需要手写 -->  #selctor    早期2.0版本 "methodName"
 5. Swift不推荐self.，但是闭包中必须要self.
 */

/// 文档注释  快捷键不可以的,需要终端输入  sudo /usr/libexec/xpccachectl  重启即可!
//1. 设置颜色 输入color 然后回车,跳出颜色选择....
//2. 图片也可以预览了   实际都是类似之前一直使用的插件功能
//3.viewDidLoad 类似OC的#pram 等
class ViewController: UIViewController {
    
    // MARK:viewDidLoad生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonLFL = UIButton.init(type: .custom)  // TODO:改下枚举类型
        buttonLFL.backgroundColor = UIColor.red
        buttonLFL.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view .addSubview(buttonLFL)
        buttonLFL .addTarget(self, action: #selector(buttonLFLClick), for: .touchUpInside)
    }
    // button action method
    func buttonLFLClick(){
        print("点击了按钮")
        print(#function)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

