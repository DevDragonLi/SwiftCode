//16年 05.30 下班回来

import UIKit
///////////////////////// Class   /////////////////////////
//构造和析构 swift 构造器无返回值(保证每个对象第一次使用前完成正确的初始化)
class DraginLi {
    var name :String
    var age : Int
    var gender : String
    //    定义指定初始化
    init(name:String,age:Int,gender:String){
        self.name = name
        self.age = age
        self.gender = gender
    }
    
//    类的便利构造器 : convenience
    convenience init(name:String){
        self.init(name:name,age: 0,gender: "")
    }
}

//let dragonLi = DraginLi()  默认是无参数的构造器
let dragonLi = DraginLi(name: "LFL", age: 23, gender: "学士")
//提示:类后面() 定位其中,按esc ,会提示对应构造器,方便书写


///////////////////////// struct  /////////////////////////

struct size {
    var width:Double
    var height:Double
}
//
let s = size(width: 10, height: 10)  // struct 默认提供构造器!

//构造器代理:减少代码重复
struct size1 {
    var width:Double
    var height:Double
    init(width:Double,height:Double){
        self.height = height
        self.width = width
    }
//    下面再提供单个,就是构造器代理代理
    init(width:Double){
        self.init(width:width,height: 0)
    }
}
//
let s1 = size1(width: 10)  // struct 默认提供构造器!
s1.height   // 也会被初始化0

//          继承
class DragonLiSon: DraginLi {
    var player :String = "test"
    init (){
        super.init(name: "dragon", age: 22, gender: "学士")
//        不可以调用父类的便利构造器
    }
//    重写,先调取父类.后面才可以自定义
    override init(name:String,age:Int,gender:String){
    super.init(name: name, age: age, gender: gender)
        self.age = 10
    }
    
//    析构
    deinit{
        print("deinit")
    }
}

//let name1 = DragonLiSon(name: "test") // 没有无参数的构造器

// 一但子类提供了他显示的指定构造器,就不会继承父类的其他构造器.可以测试得知

// init 前面加上required 子类必须实现这个指定构造器

//析构函数:类似于初始化init, 只可以class ,类中只可以一个
//调用:先调用子类,再调用父类

let kkkkk = DragonLiSon(name: "hhhh")









